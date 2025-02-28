class Game extends Phaser.Scene {
    constructor() {
        super({ key: "Game" });
        this.gameTime = 0;
        this.tileSpeed = 2;
        this.speed = 250;
        this.frame = 0;
        this.boxes = [];
        this.enemyPlanes = []; // 적 비행기 
        this.enemyBullets = []; // 적의 총알 
        this.playerBullets = []; // 플레이어의 총알 
        this.enemySpawnRate = 100; // 적 비행기 생성 주기
        this.enemySpeed = 2; // 적 비행기의 속도
        this.score = 0;
    }

    preload() {
        this.load.image("rock", "images/bullet2.png"); //적 비행기 공격으로 바꿀거임
        this.load.image("bullet", "images/playerbullet.png"); // 플레이어 공격
        this.load.image("player", "images/airplane6.png"); // 플레이어 비행기
        this.load.image("background", "images/1945.png"); // 배경
        this.load.image("enemy", "images/nenmy.png"); // 적 비행기
    }

    create() {
        this.background = this.add.tileSprite(0, 0, this.cameras.main.width, this.cameras.main.height, "background").setOrigin(0, 0);
        this.timeText = this.add.text(10, 10, 'Time : 0 ', { fontSize: '25px', fill: '#f00' });
        this.scoreText = this.add.text(10, 40, 'Score : 0', { fontSize: '25px', fill: '#0f0' }); // 🎯 점수 UI 추가
        
        
        
        this.me = this.physics.add.sprite(250, 350, "player");
        this.me.setScale(0.12);

        let cameraWidth = this.cameras.main.width;
        let cameraHeight = this.cameras.main.height;

        let bound = this.add.rectangle(cameraWidth / 2, cameraHeight + 40, cameraWidth, 5, 0xFFFFFFF);
        this.physics.add.existing(bound, true);

        this.physics.add.collider(this.boxes, bound, (box, bound) => {
            box.destroy();
            this.boxes.splice(this.boxes.indexOf(box), 1);
        });

        this.physics.add.collider(this.boxes, this.me, (box, me) => {
            this.gameOver();
        });

        this.cursor = this.input.keyboard.createCursorKeys();
        this.me.setCollideWorldBounds(true);

        this.input.keyboard.on('keydown-SPACE', () => this.shootBullet()); //총알발사

        // 적 비행기 생성 타이머
        this.enemySpawnTimer = this.time.addEvent({
            delay: 2000, // 2초마다 적 생성
            callback: this.spawnEnemy,
            callbackScope: this,
            loop: true
        });

        // 플레이어 총알과 적 비행기의 충돌 처리
        this.physics.add.overlap(this.playerBullets, this.enemyPlanes, (bullet, enemy) => {
            if (bullet.active && enemy.active) {
                bullet.destroy();
                enemy.destroy();
                this.score += 100; // 점수 증가
                this.scoreText.setText("Score : " + this.score); // UI 업데이트
                this.time.delayedCall(50, () => { // ms 후에 적 비행기 제거
                });
            }
            
        
            this.playerBullets.splice(this.playerBullets.indexOf(bullet), 1);
            this.enemyPlanes.splice(this.enemyPlanes.indexOf(enemy), 1);
        });

        // 플레이어와 적 비행기 간의 충돌 처리
        this.physics.add.collider(this.me, this.enemyPlanes, (player, enemy) => {
            this.gameOver();
        });
            
    }

    update() {
        this.frame++;
        this.background.tilePositionY -= this.tileSpeed;

        if (this.frame % 60 == 0) {
            this.gameTime++;
            this.timeText.setText("Time : " + this.gameTime);
        }

        if (this.frame % Math.max(30 - this.gameTime, 10) == 0) {  // 최소 간격 10프레임
            let box = this.physics.add.sprite(Phaser.Math.Between(0, 450), 0, "rock");
            box.setScale(25 / 125);
            box.body.setSize(10 / (10 / 125), 10 / (10 / 125));
            box.setOrigin(0, 0);
            this.boxes.push(box);
        
            // 시간이 지날수록 불덩이 속도 증가 (최대 500까지)
            let speed = Phaser.Math.Between(100 + this.gameTime * 10, 300 + this.gameTime * 10);
            box.setVelocityY(Math.min(speed, 500)); // 최대 속도 500으로 제한
        }

        if (this.gameTime >= 10) {
            this.tileSpeed = 5;
        }

        this.playerBullets.forEach(bullet => {
            bullet.update();
        });
        

        // 플레이어 이동
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

    // 적 비행기 생성 함수
    spawnEnemy() {
        let enemy = this.physics.add.sprite(Phaser.Math.Between(50, this.cameras.main.width - 50), -50, "enemy");
        enemy.setScale(0.05);
        enemy.setOrigin(0.5, 0); // 상단 중앙에 배치

        enemy.setVelocityY(Phaser.Math.Between(50, 100)); // 속도를 50 ~ 100으로 줄임

        // 물리 설정을 명확히 하여 적이 내려올 수 있도록
        enemy.setCollideWorldBounds(false);  // 충돌 방지
        enemy.setVelocityY(Phaser.Math.Between(100, 200)); // Y 방향 속도 설정

        // 적 비행기가 중력의 영향을 받지 않도록 설정
        enemy.body.setAllowGravity(false);

        this.enemyPlanes.push(enemy);
        
    }
    

    // 총알 발사 함수
    shootBullet() {
        let bullet = this.physics.add.sprite(this.me.x, this.me.y, 'bullet');
        bullet.setScale(0.1);
        bullet.setOrigin(0.5, 0.5);
        bullet.setVelocityY(-300); // 위쪽으로 발사

        this.playerBullets.push(bullet);
    }

    // 게임 오버 처리 함수
    gameOver() {
		this.sendGameDataToServlet();
        this.gameTime = 0;
        this.score = 0; // 점수 초기화
        this.scoreText.setText("Score : 0");
        this.scene.start("GameOver"); // "GameOver" 씬을 시작
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
                console.log("서블릿 응답:", data); // 게임 데이터 처리 완료
            }
        })
        .catch(error => {
            console.error("서버 요청 중 오류 발생:", error);
        });
    }
    
}
