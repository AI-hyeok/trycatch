class GameOver extends Phaser.Scene{
    constructor(){
        super({key:"GameOver"})
    }

preload(){}
create(){
    this.add.text(this.cameras.main.width/2,this.cameras.main.height/2,"Game Over",{
        fontSize:"50px",
        fill:"#f00"
    }).setOrigin(0.5);

    let restartBtn = this.add.text(this.cameras.main.width/2,this.cameras.main.height/2+40,"다시 도전",{
        fontSize:"25px",
        padding:{left:10, right:10,top:10,bottom:10}
    }).setOrigin(0.5).setInteractive();

    restartBtn.on("pointerover",()=>{
        restartBtn.setBackgroundColor("#ff0000");
        this.game.canvas.style.cursor = "pointer";
    })
    
    restartBtn.on("pointerover",()=>{
        restartBtn.setBackgroundColor("#000000");
        this.game.canvas.style.cursor = "default";
    })
    restartBtn.on("pointerdown",()=>{
        this.scene.start("Game");
    })
}
update(){} 
}   

