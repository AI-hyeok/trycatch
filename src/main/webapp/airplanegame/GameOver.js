class GameOver extends Phaser.Scene{
    constructor(){
        super({key:"GameOver"})
    }
    init(data) {
        this.finalScore = data.score;
    }
    
preload(){}
create(){
    this.add.text(this.cameras.main.width/2,this.cameras.main.height/2,"Game Over",{
        fontSize:"50px",
        fill:"#f00"
    }).setOrigin(0.5);

    this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 40, `Score: ${this.finalScore}`, {
        fontSize: "30px",
        fill: "#fff"
    }).setOrigin(0.5);
    
    let restartBtn = this.add.text(this.cameras.main.width/2,this.cameras.main.height/2+80,"다시 도전",{
        fontSize:"25px",
        padding:{left:10, right:10,top:10,bottom:10}
    }).setOrigin(0.5).setInteractive();

    restartBtn.on("pointerover",()=>{
        restartBtn.setBackgroundColor("#ff0000");
        this.game.canvas.style.cursor = "pointer";
    })
    
    restartBtn.on("pointerout",()=>{
        restartBtn.setBackgroundColor("#000000");
        this.game.canvas.style.cursor = "default";
    })
    restartBtn.on("pointerdown",()=>{
        this.scene.start("Game");
    })
}
update(){} 
}   