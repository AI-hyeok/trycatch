class GameOver extends Phaser.Scene {
    constructor() {
        super({ key: "GameOver" });
    }

    create() {
        // 게임 오버 텍스트
        this.add.text(225, 150, 'Game Over', { 
            font: '40px Arial', 
            fill: '#ff0000', 
            align: 'center' 
        }).setOrigin(0.5); // 텍스트를 화면 중앙에 맞추기 위해 origin 설정


        // 다시 하기 버튼
        let retryButton = this.add.text(225, 300, 'Retry', { 
            font: '28px Arial', 
            fill: '#0000ff' 
        }).setOrigin(0.5).setInteractive();

        retryButton.on('pointerdown', () => {
			this.scene.stop('GameOver');
            this.scene.get('Game').restart(); // 'Game' 씬을 다시 시작하면서 초기화
        })
        .on('pointerover', () => retryButton.setStyle({ fill: '#ff0000' })) // 마우스 오버 시 색상 변경
         .on('pointerout', () => retryButton.setStyle({ fill: '#0000ff' })); // 마우스 아웃 시 색상 변경

        // 나가기 버튼
        let quitButton = this.add.text(225, 350, 'Quit', {
            font: '28px Arial',
            fill: '#ff0000'
        }).setOrigin(0.5).setInteractive();

        quitButton.on('pointerdown', () => {
            window.location.href = "/index.jsp"; // 나가기 버튼 클릭 시 홈 페이지로 이동
        });
    }
}
