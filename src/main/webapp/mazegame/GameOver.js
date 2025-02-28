
class GameOver extends Phaser.Scene{
    constructor(){
        super({key:'GameOver'});
    }

    preload(){
        this.background = this.load.image("Result","images/게임결과3.png");
        this.choose = this.load.image("choose1", "images/선택 (2).png");
    }


    create(data){
        this.score = data.score;

        this.add.tileSprite(0,0,1740,1160,"Result");
        let restart = this.add.tileSprite(270,490,958,520,"choose1");
        let main = this.add.tileSprite(610,495,958,517,"choose1");

        restart.setDisplaySize(150, 50);
        main.setDisplaySize(150, 50);

        let scoreText = this.add.text(480, 295, `${this.score}`, {
            fontSize: '60px',
            fill: '#c90a1a',
            fontStyle: 'bold'
        }).setOrigin(0.5);
       this.sendGameDataToServlet();

        let restartBtn = this.add.text(260,490,"RetryGame",{
            fontSize: '25px',
            padding:{left:10, right:10, top:10, bottom:10}
        }).setOrigin(0.5).setInteractive();

        restartBtn.setAlpha(0.01);
        restart.setVisible(false);

        restartBtn.on("pointerover",()=>{
            restart.setVisible(true);
            this.game.canvas.style.cursor = "pointer";
        })

        restartBtn.on("pointerout",()=>{
            restart.setVisible(false);
            this.game.canvas.style.cursor = "default";
        })

        restartBtn.on("pointerdown",()=>{
            this.scene.start("SelectMode");
        })


        let goToMainBtn = this.add.text(610,495,"RetryGame",{
            fontSize: '25px',
            padding:{left:10, right:10, top:10, bottom:10}
        }).setOrigin(0.5).setInteractive();

        goToMainBtn.setAlpha(0.01);
        main.setVisible(false);

        goToMainBtn.on("pointerover",()=>{
            main.setVisible(true);
            this.game.canvas.style.cursor = "pointer";
        })

        goToMainBtn.on("pointerout",()=>{
            main.setVisible(false);
            this.game.canvas.style.cursor = "default";
        })

        goToMainBtn.on("pointerdown",()=>{
            this.scene.start("Start");
        })

    }
 sendGameDataToServlet() {
        // 게임 오버 시 서버에 점수 저장 요청
        fetch("/addScore.games", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: `gameScore=${this.score}&gameId=5&gameName=maze`
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
   
    update(){
        
    }



}