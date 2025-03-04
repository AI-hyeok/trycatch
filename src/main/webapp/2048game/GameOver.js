class GameOver extends Phaser.Scene {
    constructor() {
        super({ key: "GameOver" });
    }

    create() {
    
        this.add.text(225, 150, 'Game Over', { 
            font: '40px Arial', 
            fill: '#ff0000', 
            align: 'center' 
        }).setOrigin(0.5);


        let retryButton = this.add.text(225, 300, 'Retry', { 
            font: '28px Arial', 
            fill: '#0000ff' 
        }).setOrigin(0.5).setInteractive();

        retryButton.on('pointerdown', () => {
    		this.scene.stop('GameOver');
    		this.scene.stop('GameOver');
    		this.scene.get('Game').restart();
        })
        .on('pointerover', () => retryButton.setStyle({ fill: '#ff0000' }))
        .on('pointerout', () => retryButton.setStyle({ fill: '#0000ff' }));


        let quitButton = this.add.text(225, 350, 'Quit', {
            font: '28px Arial',
            fill: '#ff0000'
        }).setOrigin(0.5).setInteractive();

        quitButton.on('pointerdown', () => {
            window.location.href = "/index.jsp";
        });
    }
}
