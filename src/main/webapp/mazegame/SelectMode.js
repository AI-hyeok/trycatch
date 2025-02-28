
class SelectMode extends Phaser.Scene{
    constructor(){
        super({key:'SelectMode'});
    }

    preload(){
        this.background = this.load.image("Selectbackground","images/난이도선택2.png");
        this.selectImg = this.load.image("selectImg", "images/선택 (2).png");
    }


    create(){
        this.add.tileSprite(0,0,1740,1160,"Selectbackground");
        let selectEasy = this.add.tileSprite(200,320,958,520, "selectImg");
        let selectNormal = this.add.tileSprite(420,320,958,520, "selectImg");
        let selectHard = this.add.tileSprite(665,320,958,520, "selectImg");

        selectEasy.setDisplaySize(150, 70);
        selectNormal.setDisplaySize(150, 70);
        selectHard.setDisplaySize(150, 70);
        

        let easyBtn = this.add.text(200,320,"easy",{
            fontSize: '25px',
            padding:{left:10, right:10, top:10, bottom:10}
        }).setOrigin(0.5).setInteractive();

        easyBtn.setAlpha(0.01);
        selectEasy.setVisible(false);

        easyBtn.on("pointerover",()=>{
            selectEasy.setVisible(true);
            this.game.canvas.style.cursor = "pointer";
        })

        easyBtn.on("pointerout",()=>{
            selectEasy.setVisible(false);
            this.game.canvas.style.cursor = "default";
        })

        easyBtn.on("pointerdown",()=>{
            this.scene.start("Play");
        })


        let normalBtn = this.add.text(420,320,"nor",{
            fontSize: '25px',
            padding:{left:10, right:10, top:10, bottom:10}
        }).setOrigin(0.5).setInteractive();

        normalBtn.setAlpha(0.01);
        selectNormal.setVisible(false);

        normalBtn.on("pointerover",()=>{
            selectNormal.setVisible(true);
            this.game.canvas.style.cursor = "pointer";
        })

        normalBtn.on("pointerout",()=>{
            selectNormal.setVisible(false);
            this.game.canvas.style.cursor = "default";
        })

        normalBtn.on("pointerdown",()=>{
            this.scene.start("Play2");
        })


        let hardBtn = this.add.text(665,320,"haard",{
            fontSize: '25px',
            padding:{left:10, right:10, top:10, bottom:10}
        }).setOrigin(0.5).setInteractive();

        hardBtn.setAlpha(0.01);
        selectHard.setVisible(false);

        hardBtn.on("pointerover",()=>{
            selectHard.setVisible(true);
            this.game.canvas.style.cursor = "pointer";
        })

        hardBtn.on("pointerout",()=>{
            selectHard.setVisible(false);
            this.game.canvas.style.cursor = "default";
        })

        hardBtn.on("pointerdown",()=>{
            this.scene.start("Play3");
        })

        this.cursor = this.input.keyboard.createCursorKeys();

    }

    
    update(){

       
    }



}