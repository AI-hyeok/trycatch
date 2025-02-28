
class Start extends Phaser.Scene{
    constructor(){
        super({key:'Start'});
    }

    preload(){
        this.background = this.load.image("Startbackground","images/게임시작화면.png");
        this.select1 = this.load.image("select1", "images/게임방법선택.png");
        this.select2 = this.load.image("select2", "images/게임시작선택.png");
    }


    create(){
        this.add.tileSprite(0,0,1740,1160,"Startbackground");
        let select1 = this.add.tileSprite(670,401,1609, 534, "select1");
        let select2 = this.add.tileSprite(220,410,1609, 534, "select2");

        select1.setDisplaySize(300, 90);
        select2.setDisplaySize(300, 90);

        let howToPlayBtn = this.add.text(600,401,"HowtoPlay",{
            fontSize: '25px',
            padding:{left:10, right:10, top:10, bottom:10}
        }).setOrigin(0.5).setInteractive();

        howToPlayBtn.setAlpha(0.01);
        select1.setVisible(false);

        howToPlayBtn.on("pointerover",()=>{
            select1.setVisible(true);
            this.game.canvas.style.cursor = "pointer";
        })

        howToPlayBtn.on("pointerout",()=>{
            select1.setVisible(false);
            this.game.canvas.style.cursor = "default";
        })

        howToPlayBtn.on("pointerdown",()=>{
            this.scene.start("Rule");
        })


        let playBtn = this.add.text(250,401,"PlayGame",{
            fontSize: '25px',
            padding:{left:10, right:10, top:10, bottom:10}
        }).setOrigin(0.5).setInteractive();

        playBtn.setAlpha(0.01);
        select2.setVisible(false);

        playBtn.on("pointerover",()=>{
            select2.setVisible(true);
            this.game.canvas.style.cursor = "pointer";
        })

        playBtn.on("pointerout",()=>{
            select2.setVisible(false);
            this.game.canvas.style.cursor = "default";
        })

        playBtn.on("pointerdown",()=>{
            this.scene.start("SelectMode");
        })
    }

    
    update(){
        
    }



}