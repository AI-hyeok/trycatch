
class Rule extends Phaser.Scene{
    constructor(){
        super({key:'Rule'});
    }

    preload(){
        this.background = this.load.image("HowtoPlay","images/게임방법.png");
        this.choose = this.load.image("choose", "images/선택 (2).png");
    }


    create(){
        this.add.tileSprite(0,0,1740,1160,"HowtoPlay");
        let start = this.add.tileSprite(this.cameras.main.width/2,500,958,517,"choose");

        start.setDisplaySize(150, 80);

        let playBtn = this.add.text(this.cameras.main.width/2,500,"PlayGame",{
            fontSize: '25px',
            padding:{left:10, right:10, top:10, bottom:10}
        }).setOrigin(0.5).setInteractive();

        playBtn.setAlpha(0.01);
        start.setVisible(false);

        playBtn.on("pointerover",()=>{
            start.setVisible(true);
            this.game.canvas.style.cursor = "pointer";
        })

        playBtn.on("pointerout",()=>{
            start.setVisible(false);
            this.game.canvas.style.cursor = "default";
        })

        playBtn.on("pointerdown",()=>{
            this.scene.start("SelectMode");
        })
    }

    
    update(){
        
    }



}