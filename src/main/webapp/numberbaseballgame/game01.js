class game01 extends Phaser.Scene {
    constructor() {
        super({ key: "game01" });
        this.targetNumber = "";  // 목표 숫자
        this.guess = "";  // 사용자가 입력한 숫자
        this.strikes = 0;  // 스트라이크 수
        this.balls = 0;    // 볼 수
        this.attemptCount = 0; // 시도 횟수 추가
        this.resultYPosition = 380;  // 결과가 쌓이는 위치
         this.maxScore = 100; // 첫 번째 시도 점수
    }

    preload() {}

    create() {
        // 목표 숫자 생성
        this.generateTargetNumber();

        // 게임 설명 텍스트
        this.add.text(20, 20, "숫자야구 게임 - 4자리 숫자를 맞춰보세요!", { font: "20px Arial", fill: "#fff" });

        // 숫자 버튼 배치
        let buttonX = 100;
        let buttonY = 100;
        this.buttons = [];

        // 숫자 버튼 배치 10개를 세로로 배치
        for (let i = 0; i <= 9; i++) {
            let button = this.add.text(buttonX, buttonY, i.toString(), { font: "30px Arial", fill: "#fff", backgroundColor: "#000", padding: { x: 10, y: 5 } }).setInteractive();
            button.on('pointerdown', () => this.appendNumber(i));
            this.buttons.push(button);
            buttonX += 80;  // 1개 버튼당 가로 간격을 충분히 확보
            if (i === 4) {  // 5번째 버튼에서 줄바꿈
                buttonX = 100;
                buttonY += 60;  // 5개마다 새로운 줄로 이동
            }
        }

        // 입력된 숫자 표시
        this.inputDisplay = this.add.text(200, 250, "", { font: "30px Arial", fill: "#fff" });

        // "입력" 버튼
        this.submitButton = this.add.text(200, 320, "입력", { font: "20px Arial", fill: "#fff", backgroundColor: "#000", padding: { x: 10, y: 5 } }).setInteractive();
        this.submitButton.on('pointerdown', () => {
            if (this.guess.length === 4) {
                this.checkGuess();
            } else {
                alert("4자리 숫자를 입력해주세요.");
            }
        });

        // 결과 표시 텍스트
        this.resultText = this.add.text(20, this.resultYPosition, "", { font: "20px Arial", fill: "#fff" });

        // 새 게임 버튼 (스타일 적용) - 축하합니다 아래로 배치
        this.newGameButton = this.add.text(200, 460, "새 게임 시작", {
            font: "32px Arial",
            fill: "#fff",
            backgroundColor: "#28a745", // 녹색 배경
            padding: { x: 20, y: 10 },
            align: 'center'
        }).setInteractive().setVisible(false);

        // 시도 횟수 텍스트
        this.attemptText = this.add.text(200, 500, "", {
            font: "24px Arial",
            fill: "#fff",
            align: 'center'
        }).setVisible(false);

        // 버튼 클릭 이벤트
        this.newGameButton.on('pointerdown', () => this.startNewGame());

        // 버튼 마우스 오버 효과
        this.newGameButton.on('pointerover', () => {
            this.newGameButton.setStyle({ backgroundColor: "#218838" }); // 어두운 녹색
        });

        // 버튼 마우스 아웃 효과
        this.newGameButton.on('pointerout', () => {
            this.newGameButton.setStyle({ backgroundColor: "#28a745" }); // 원래 색으로 복귀
        });
    }

    update() {}

    // 목표 숫자 생성 (중복 없는 4자리 숫자)
    generateTargetNumber() {
        let numbers = [];
        while (numbers.length < 4) {
            let num = Math.floor(Math.random() * 10);
            if (!numbers.includes(num)) {
                numbers.push(num);
            }
        }
        this.targetNumber = numbers.join('');
    }

    // 숫자 버튼 클릭 시, 숫자 입력
    appendNumber(number) {
        if (this.guess.length < 4) {
            this.guess += number;
            this.inputDisplay.setText(this.guess);
        }
    }

    // 추측한 숫자와 목표 숫자를 비교하여 스트라이크와 볼 계산
    checkGuess() {
        this.strikes = 0;
        this.balls = 0;
        this.attemptCount++;  // 시도 횟수 증가

        for (let i = 0; i < 4; i++) {
            if (this.guess[i] === this.targetNumber[i]) {
                this.strikes++;
            } else if (this.targetNumber.includes(this.guess[i])) {
                this.balls++;
            }
        }

        // 결과 업데이트 (새로운 결과는 위에 표시)
        let resultMessage = `결과: ${this.strikes} 스트라이크, ${this.balls} 볼`;
        
        // 결과 텍스트를 위로 쌓기
        this.resultText.setText(resultMessage + "\n" + this.resultText.text);
        this.resultYPosition -= 30;  // 결과 텍스트의 y 좌표를 조정하여 위로 쌓임

        console.log(`사용자 추측: ${this.guess}, 목표 숫자: ${this.targetNumber}`);

        // 모든 스트라이크가 맞으면 게임 종료
        if (this.strikes === 4) {
			let score = this.calculateScore(); 
            this.resultText.setText("축하합니다! 목표 숫자 " + this.targetNumber + "를 맞혔습니다.\n" + this.resultText.text);
            this.submitButton.setInteractive(false); // 게임 종료 후 더 이상 입력을 받지 않음
            this.newGameButton.setVisible(true); // 새 게임 버튼 표시

            // 시도 횟수 표시
            this.attemptText.setText(`정답을 ${this.attemptCount}번 만에 맞췄습니다!`);
            this.attemptText.setVisible(true); // 시도 횟수 텍스트 보이기

        	this.sendGameDataToServlet(score);
            
        }

        // 입력 필드 초기화
        this.guess = "";
        this.inputDisplay.setText(this.guess);

    }
    
        calculateScore() {
        let score = this.maxScore - (this.attemptCount - 1) * 10;  // 10점씩 차감
        return Math.max(score, 0);  // 점수가 0 미만이 되지 않도록 처리
    }

    // 새 게임 시작
    startNewGame() {
        this.targetNumber = "";
        this.guess = "";
        this.strikes = 0;
        this.balls = 0;
        this.attemptCount = 0; // 시도 횟수 초기화

        // 목표 숫자 재생성
        this.generateTargetNumber();

        // 입력 필드와 결과 텍스트 초기화
        this.inputDisplay.setText("");
        this.resultText.setText("");
        this.attemptText.setText(""); // 시도 횟수 텍스트 초기화

        // 새 게임 버튼 숨기기
        this.newGameButton.setVisible(false);

        // "입력" 버튼 활성화
        this.submitButton.setInteractive(true);
    }

    sendGameDataToServlet(score) {
        // 게임 오버 시 서버에 점수 저장 요청
        fetch("/addScore.games", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: `gameScore=${score}&gameId=2&gameName=baseball`
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
