
class Play extends Phaser.Scene{
    constructor(){
        super({key:'Play'});
        this.frame = 0;
        this.speed = 300;
        this.score = 0;
        this.gameTime = 60;
    }

    preload(){
        this.background = this.load.image("background","images/게임배경.png");
        this.load.spritesheet('me', "images/캐릭터.png",{frameWidth:400/4, frameHeight:2000/20});
    }


    create(){
        let background = this.add.tileSprite(0,0,1740,1160,"background");
        background.setOrigin(0,0);
        this.me = this.physics.add.sprite(100, 500, "me");
        this.me.setDisplaySize(80, 80);
        this.me.setSize(50, 50);
        this.me.setOffset(25, 25);
        this.me.anims.play("right", true);

        let preventLine = this.add.rectangle(890, 190, 1300, 15);
        let preventLine2 = this.add.rectangle(890, 960, 1300, 15);
        let preventLinenot4 = this.add.rectangle(20, 360, 420, 15);
        let preventLinenot5 = this.add.rectangle(20, 765, 455, 15);
        let preventLine3 = this.add.rectangle(390, 360, 300, 15);
        let preventLine4 = this.add.rectangle(1060, 360, 880, 15);
        let preventLine5 = this.add.rectangle(470, 505, 300, 15);
        let preventLine6  = this.add.rectangle(825, 505, 160, 15);
        let preventLine7 = this.add.rectangle(1130, 505, 150, 15,);
        let preventLine8 = this.add.rectangle(380, 630, 300, 15);
        let preventLine9 = this.add.rectangle(695, 630, 165, 15);
        let preventLine10 = this.add.rectangle(995, 585, 160, 15);
        let preventLine11 = this.add.rectangle(1110, 670, 160, 15);
        let preventLine12 = this.add.rectangle(990, 775, 160, 15);
        let preventLine13 = this.add.rectangle(770, 735, 280, 15);
        let preventLine14 = this.add.rectangle(720, 865, 700, 15);
        let preventLinenot1 = this.add.rectangle(1635, 630, 250, 15);
        let preventLinenot2 = this.add.rectangle(1635, 715, 250, 15); 

        let preventLine15 = this.add.rectangle(243, 410, 8, 450);
        let preventLinenot3 = this.add.rectangle(230, 505, 8, 260);
        let preventLine16 = this.add.rectangle(240, 865, 15, 200);
        let preventLine17 = this.add.rectangle(378, 705, 15, 155);
        let preventLine18 = this.add.rectangle(520, 705, 15, 155);
        let preventLine19 = this.add.rectangle(1505, 413, 15, 450);
        let preventLine20 = this.add.rectangle(1505, 860, 15, 300);

        let preventLine21 = this.add.rectangle(625, 495, 15, 270);
        let preventLine22 = this.add.rectangle(910, 570, 15, 410);
        let preventLine23 = this.add.rectangle(1060, 820, 15, 100);
        let preventLine24 = this.add.rectangle(1197, 728, 15, 450);
        let preventLine25 = this.add.rectangle(1299, 585, 15, 450);
        let preventLine26 = this.add.rectangle(1400, 785, 15, 450);

        let safezone = this.add.rectangle(120, 550, 230, 420);

        let endLine = this.add.rectangle(1740, 675, 15, 60);
        

        this.timeText = this.add.text(20,20, "Time : 60", {fontSize:'30px', fill:'#f00'});
        this.timeText.setScrollFactor(0);

        this.physics.add.existing(safezone, true);
        this.physics.add.existing(preventLine, true);
        this.physics.add.existing(endLine, true);

        this.physics.add.overlap(this.me, safezone, () => {
            this.timerStarted = false;
            this.gameTime=60;
            this.timeText.setText("Time : " + this.gameTime);
        });
        
        this.physics.world.setBounds(0,0,background.width,background.height);
        this.cameras.main.setBounds(0,0,background.width,background.height);

        this.me.setCollideWorldBounds(true);
        this.cameras.main.startFollow(this.me);

        this.prevetLinenots = [preventLinenot1, preventLinenot2, preventLinenot3, preventLinenot4, preventLinenot5];

        this.prevetLinenots.forEach(preventLinenot => {
            this.physics.add.existing(preventLinenot, true);
            this.physics.add.collider(this.me, preventLinenot, () => {
                
            });
        });

        this.preventLines = [preventLine, preventLine2, preventLine3, preventLine4, preventLine5, preventLine6, preventLine7, preventLine8, preventLine9, preventLine10,
                             preventLine11, preventLine12, preventLine13, preventLine14, preventLine15, preventLine16, preventLine17, preventLine18, preventLine19, preventLine20,
                             preventLine21, preventLine22, preventLine23, preventLine24, preventLine25, preventLine26];
        


                             
        this.preventLines.forEach(preventLine => {
            this.physics.add.existing(preventLine, true);
            this.physics.add.collider(this.me, preventLine, () => {
                this.timerStarted = false;
                if (this.input.activePointer.isDown === false) {
                    this.cursor.left.reset();
                    this.cursor.right.reset();
                    this.cursor.up.reset();
                    this.cursor.down.reset();
                }

                if(this.gameTime < 1){
                    this.score = 0;
                }else{
                    this.score = (60 - this.gameTime/2)*2;
                }

                
                this.gameTime = 60;
                this.scene.start("GameOver", {score:this.score});
                
            });
        });


        this.physics.add.collider(endLine, this.me, (me, endLine) => {
            this.timerStarted = false;
            if (this.input.activePointer.isDown === false) {
                this.cursor.left.reset();
                this.cursor.right.reset();
                this.cursor.up.reset();
                this.cursor.down.reset();
            }

            if(this.gameTime < 1){
                this.score = 0;
            }else{
                this.score = 300 + this.gameTime;
            }
            
            this.gameTime = 60;
            this.scene.start("GameOver", {score:this.score});
            
        });

        this.cursor = this.input.keyboard.createCursorKeys();

        this.anims.create({
            key:"left",
            frames:this.anims.generateFrameNumbers("me", {start:0,end:18}),
            frameRate:18,
            repeat:-1
        });


        this.anims.create({
            key:"right",
            frames:this.anims.generateFrameNumbers("me", {start:20,end:38}),
            frameRate:18,
            repeat:-1
        });



        this.anims.create({
            key:"up",
            frames:this.anims.generateFrameNumbers("me", {start:60,end:78}),
            frameRate:18,
            repeat:-1
        });


        this.anims.create({
            key:"down",
            frames:this.anims.generateFrameNumbers("me", {start:40,end:58}),
            frameRate:18,
            repeat:-1
        });



    }

    
    update(){
        this.frame++;

        if (!this.timerStarted && (this.cursor.left.isDown || this.cursor.right.isDown || this.cursor.up.isDown || this.cursor.down.isDown)) {
            this.timerStarted = true;
        }

        

        if (this.timerStarted) {
            if(this.frame%60 === 0 && this.gameTime > 0){
                this.gameTime--;
                this.timeText.setText("Time : " + this.gameTime); 
            }
        }

        if(this.gameTime == 0){
            this.score = 0;
            this.scene.start("GameOver", {score:this.score});
        }

        this.timeText.setStyle({
            fontSize: '30px',
            fill: '#2e3d86',           
            fontFamily: 'Verdana',  
            fontStyle: 'bold',      
            stroke: '#fff',         
            strokeThickness: 5     
        });
        
        

        if(this.cursor.left.isDown){
            this.me.anims.play("left", true);
            this.me.setVelocityY(0);
            this.me.setVelocityX(-this.speed);
            
        }else if(this.cursor.right.isDown){
            this.me.anims.play("right", true);
            this.me.setVelocityY(0);
            this.me.setVelocityX(this.speed);
            
        }else if(this.cursor.up.isDown){
            this.me.anims.play("down", true);
            this.me.setVelocityX(0);
            this.me.setVelocityY(-this.speed);
            
        }else if(this.cursor.down.isDown){
            this.me.anims.play("up", true);
            this.me.setVelocityX(0);
            this.me.setVelocityY(this.speed);
            
        }
    }

   
    

}