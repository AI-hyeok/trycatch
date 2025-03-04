class Game extends Phaser.Scene {
    constructor() {
        super({ key: "Game" });
        this.resetGame();
    }
        
    resetGame(){

        this.gameTime = 0;
        this.score = 0;
        this.currentStage = 1;  
        this.tileSpeed = 2;
        this.enemySpawnInterval = 1000; 
        this.frame = 0;
        
        this.speed = 250;
        this.stageText = null;  
        
        this.boxes = [];
        this.playerBullets = []; 
        this.enemyPlanes = []; 
        this.enemyBullets = []; 
    }    

    preload() {
        this.load.image("attack", "images/bullet2.png"); // 적 공격
        this.load.image("bullet", "images/playerbullet.png"); // 플레이어 공격
        this.load.image("player", "images/airplane6.png"); // 플레이어 비행기
        this.load.image("background", "images/1945.png"); // 배경
        this.load.image("enemy", "images/nenmy.png"); // 적 비행기
    }

    create() {
        this.background = this.add.tileSprite(0, 0, this.cameras.main.width, this.cameras.main.height, "background").setOrigin(0, 0);

        this.timeText = this.add.text(10, 10, 'Time : 0 ', { fontSize: '25px', fill: '#f00' });
        this.scoreText = this.add.text(10, 40, 'Score : 0', { fontSize: '25px', fill: '#0f0' }); 

        this.me = this.physics.add.sprite(250, 350, "player");
        this.me.setScale(0.12);
        this.me.setCollideWorldBounds(true);

        this.cursor = this.input.keyboard.createCursorKeys();
        this.input.keyboard.on('keydown-SPACE', () => this.shootBullet());

        
        this.enemySpawnTimer = this.time.addEvent({
            delay: this.enemySpawnInterval,  
            callback: this.spawnEnemy,
            callbackScope: this,
            loop: true
        });

    
        this.physics.add.overlap(this.playerBullets, this.enemyPlanes, (bullet, enemy) => { 
            if (bullet.active && enemy.active) {
                bullet.destroy();
                enemy.destroy();
                this.score += 50; 
                this.scoreText.setText("Score : " + this.score);
            }
            this.playerBullets.splice(this.playerBullets.indexOf(bullet), 1);
            this.enemyPlanes.splice(this.enemyPlanes.indexOf(enemy), 1);
        });

        this.physics.add.collider(this.me, this.enemyPlanes, (player, enemy) => { 
            this.gameOver();
        });

        this.physics.add.collider(this.me, this.enemyBullets, (player, bullet) => {
            this.gameOver();
        });

        this.enemyFireTimer = this.time.addEvent({
            delay: 500, 
            callback: this.shootEnemyBullets,
            callbackScope: this,
            loop: true
        });
    }

    update() {
        this.frame++;
        this.background.tilePositionY -= this.tileSpeed;

        if (this.frame % 60 == 0) {
            this.gameTime++;
            this.timeText.setText("Time : " + this.gameTime);

            
            if (this.gameTime >= 12 && this.currentStage === 1) {
                this.currentStage = 2;
                this.updateStage(); 
                this.showStageText("2 STAGE");
            } else if (this.gameTime >= 18 && this.currentStage === 2) {
                this.currentStage = 3;
                this.updateStage(); 
                this.showStageText("3 STAGE");
            }
        }

        if (this.gameTime >= 10) {
            this.tileSpeed = 5;
        }
        if (this.currentStage === 3) {
            
            this.tileSpeed = 8;
            this.speed = 300; 
        }


        this.playerBullets.forEach(bullet => {
            bullet.update();
        });

        if (this.cursor.left.isDown) {
            this.me.setVelocityX(-this.speed);
        } else if (this.cursor.right.isDown) {
            this.me.setVelocityX(this.speed);
        } else {
            this.me.setVelocityX(0);
        }

        if (this.cursor.up.isDown) {
            this.me.setVelocityY(-this.speed);
        } else if (this.cursor.down.isDown) {
            this.me.setVelocityY(this.speed);
        } else {
            this.me.setVelocityY(0);
        }
    }

    updateStage() {
        
        if (this.currentStage === 2) {
            this.enemySpawnInterval = 500;  
        } else if (this.currentStage === 3) {
            this.enemySpawnInterval = 300;  
        }

        
        this.enemySpawnTimer.reset({
            delay: this.enemySpawnInterval, 
            callback: this.spawnEnemy,
            callbackScope: this,
            loop: true
        });
    }

    showStageText(stageText) {
        
        if (this.stageText) {
            this.stageText.destroy();  
        }

       
        this.stageText = this.add.text(this.cameras.main.centerX, this.cameras.main.centerY, stageText, {
            fontSize: '40px',
            fill: '#fff',
            fontStyle: 'bold'
        }).setOrigin(0.5, 0.5);

        
        this.time.delayedCall(2000, () => {
            if (this.stageText) {
                this.stageText.destroy();
            }
        });
    }

    spawnEnemy() {
        let cameraWidth = this.cameras.main.width;

       
        let enemyX = Phaser.Math.Between(50, cameraWidth - 20);
        let enemyY = 2; 
    
        let enemy = this.physics.add.sprite(enemyX, enemyY, "enemy");
        
        enemy.setScale(0.065);
        enemy.body.setSize(0.05, 0.05);
        enemy.setOrigin(0.5, 0);
        enemy.setVelocityY(Phaser.Math.Between(100, 100));
        enemy.body.setAllowGravity(false);
        enemy.isAlive = true;

        enemy.on('destroy', () => {
            if (enemy.isAlive) {
                enemy.isAlive = false;
            }
        });

        this.enemyPlanes.push(enemy);

        let randomPattern = Phaser.Math.Between(0, 1);
        if (randomPattern === 1) {
            this.time.addEvent({
                delay: Phaser.Math.Between(500, 800),
                callback: () => this.shootEnemyBullet(enemy, 'spread'),
                callbackScope: this,
                loop: true
            });
        } else {
            this.time.addEvent({
                delay: Phaser.Math.Between(500, 800), 
                callback: () => this.shootEnemyBullet(enemy),
                callbackScope: this,
                loop: true
            });
        }
    }

    shootBullet() {
        let bullet = this.physics.add.sprite(this.me.x, this.me.y, 'bullet');
        bullet.setScale(0.1);
        bullet.setOrigin(0.5, 0.5);
        bullet.setVelocityY(-300); 
        this.playerBullets.push(bullet);
    }

    gameOver() {
        this.sendGameDataToServlet();
        this.scene.start("GameOver", { score: this.score });
        this.resetGame();
        this.scoreText.setText("Score : 0");
        this.scene.start("GameOver"); 
    }

    shootEnemyBullet(enemy, pattern) {
        if (enemy.isAlive) {
            if (pattern === 'spread') {
             
                for (let angle = -45; angle <= 45; angle += 15) {  
                    let attack = this.physics.add.sprite(enemy.x, enemy.y, 'attack');
                    attack.setScale(25 / 125);
                    attack.setOrigin(0.5, 0.5);

                 
                    let radian = Phaser.Math.DegToRad(angle);
                    let speed = 200; 

                  
                    attack.setVelocityX(200);  
                    attack.setVelocityY(200); 

                    
                    this.enemyBullets.push(attack);
                }
            }
        }
    }

    shootEnemyBullet(enemy) {
        if (enemy.isAlive) {
            let attack = this.physics.add.sprite(enemy.x, enemy.y, 'attack');
            attack.setScale(0.2);
            attack.setOrigin(0.5, 0.5);
    
            let playerX = this.me.x; // 
            let playerY = this.me.y; // 
    
            let directionX = playerX - enemy.x; // 
            let directionY = playerY - enemy.y; // 
            let length = Math.sqrt(directionX * directionX + directionY * directionY); 
    
            let speed = 300;
            let velocityX = (directionX / length) * speed;
            let velocityY = (directionY / length) * speed;
    
            attack.setVelocityX(velocityX);
            attack.setVelocityY(velocityY);
    
            this.enemyBullets.push(attack);
        }
    }
    sendGameDataToServlet() {
        // 게임 오버 시 서버에 점수 저장 요청
        fetch("/addScore.games", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: `gameScore=${this.score}&gameId=3&gameName=airplane`
        })
        .then(response => response.text())
        .then(data => {
            if (data === "LOGIN_REQUIRED") {
                alert("로그인을 하지 않은 상태에서는 점수를 저장할 수 없습니다."); // 로그인되지 않은 경우 경고 메시지
            } else {
            }
        })
        .catch(error => {
            console.error("서버 요청 중 오류 발생:", error);
        });
    }
}
