class Game extends Phaser.Scene {
    constructor() {
        super({ key: "Game" });
        this.gridSize = 4;
        this.tileSize = 100;
        this.grid = [];
        this.tiles = [];
        this.score = 0;
        this.isGameOver = false;
        this.isKeyPressed = false;
    }

    preload() {
        for (let value of [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048]) {
            this.load.image(`block${value}`, `images/block${value}.png`);
        }
    }

    create() {
        this.cameras.main.setBackgroundColor('#ffffff50');
        this.cursor = this.input.keyboard.createCursorKeys();
        this.initializeGrid();
        this.addRandomTile();
        this.addRandomTile();
        this.updateScore(); // 점수 업데이트
        this.drawTiles();
        

    }
	restart() {
		 console.log("Game Restarting...");
        // 게임 상태 초기화
        this.grid = [];
        this.tiles = [];
        this.score = 0;
        this.isGameOver = false;
        this.isKeyPressed = false;

        this.initializeGrid();
        this.addRandomTile();
        this.addRandomTile();
        this.updateScore(); // 점수 초기화
        this.drawTiles(); // 타일 그리기
    }

    initializeGrid() {
        this.grid = Array.from({ length: this.gridSize }, () => Array(this.gridSize).fill(0));
    }

    addRandomTile() {
        let emptyTiles = [];
        for (let i = 0; i < this.gridSize; i++) {
            for (let j = 0; j < this.gridSize; j++) {
                if (this.grid[i][j] === 0) {
                    emptyTiles.push({ x: i, y: j });
                }
            }
        }
        if (emptyTiles.length > 0) {
            let { x, y } = emptyTiles[Math.floor(Math.random() * emptyTiles.length)];
            this.grid[x][y] = Math.random() < 0.9 ? 2 : 4;
        }
    }

    drawTiles() {
        this.tiles.forEach(tile => tile.destroy());
        this.tiles = [];
        for (let i = 0; i < this.gridSize; i++) {
            for (let j = 0; j < this.gridSize; j++) {
                let value = this.grid[i][j];
                if (value !== 0) {
                    let tile = this.add.image(
                        j * this.tileSize + this.tileSize / 2,
                        i * this.tileSize + this.tileSize / 2,
                        `block${value}`
                    );
                    tile.setOrigin(0.5, 0.5);
                    this.tiles.push(tile);
                }
            }
        }
    }

    moveTiles(direction) {
        let moved = false;

        if (direction === 'left') {
            moved = this.shiftAndMergeLeft();
        } else if (direction === 'right') {
            moved = this.shiftAndMergeRight();
        } else if (direction === 'up') {
            moved = this.shiftAndMergeUp();
        } else if (direction === 'down') {
            moved = this.shiftAndMergeDown();
        }

        if (moved) {
            this.addRandomTile();
            this.drawTiles();
            this.updateScore();
            this.checkGameOver();
        }
    }

    shiftAndMergeLeft() {
        let moved = false;
        for (let row = 0; row < this.gridSize; row++) {
            let newRow = this.grid[row].filter(val => val !== 0);
            for (let i = 0; i < newRow.length - 1; i++) {
                if (newRow[i] === newRow[i + 1]) {
                    newRow[i] *= 2;
                    this.score += newRow[i];
                    newRow.splice(i + 1, 1);
                }
            }
            while (newRow.length < this.gridSize) newRow.push(0);
            if (this.grid[row].toString() !== newRow.toString()) moved = true;
            this.grid[row] = newRow;
        }
        return moved;
    }

    shiftAndMergeRight() {
        let moved = false;
        for (let row = 0; row < this.gridSize; row++) {
            let newRow = this.grid[row].filter(val => val !== 0).reverse();
            for (let i = 0; i < newRow.length - 1; i++) {
                if (newRow[i] === newRow[i + 1]) {
                    newRow[i] *= 2;
                    this.score += newRow[i];
                    newRow.splice(i + 1, 1);
                }
            }
            while (newRow.length < this.gridSize) newRow.push(0);
            newRow.reverse();
            if (this.grid[row].toString() !== newRow.toString()) moved = true;
            this.grid[row] = newRow;
        }
        return moved;
    }

    shiftAndMergeUp() {
        let moved = false;
        for (let col = 0; col < this.gridSize; col++) {
            let newCol = [];
            for (let row = 0; row < this.gridSize; row++) {
                if (this.grid[row][col] !== 0) newCol.push(this.grid[row][col]);
            }
            for (let i = 0; i < newCol.length - 1; i++) {
                if (newCol[i] === newCol[i + 1]) {
                    newCol[i] *= 2;
                    this.score += newCol[i];
                    newCol.splice(i + 1, 1);
                }
            }
            while (newCol.length < this.gridSize) newCol.push(0);
            for (let row = 0; row < this.gridSize; row++) {
                if (this.grid[row][col] !== newCol[row]) moved = true;
                this.grid[row][col] = newCol[row];
            }
        }
        return moved;
    }

    shiftAndMergeDown() {
        let moved = false;
        for (let col = 0; col < this.gridSize; col++) {
            let newCol = [];
            for (let row = 0; row < this.gridSize; row++) {
                if (this.grid[row][col] !== 0) newCol.push(this.grid[row][col]);
            }
            for (let i = 0; i < newCol.length - 1; i++) {
                if (newCol[i] === newCol[i + 1]) {
                    newCol[i] *= 2;
                    this.score += newCol[i];
                    newCol.splice(i + 1, 1);
                }
            }
            while (newCol.length < this.gridSize) newCol.unshift(0);
            for (let row = 0; row < this.gridSize; row++) {
                if (this.grid[row][col] !== newCol[row]) moved = true;
                this.grid[row][col] = newCol[row];
            }
        }
        return moved;
    }

    checkGameOver() {
        for (let row = 0; row < this.gridSize; row++) {
            for (let col = 0; col < this.gridSize; col++) {
                let value = this.grid[row][col];
                if (value === 0) return;
    
                if (row < this.gridSize - 1 && this.grid[row + 1][col] === value) return;
                if (col < this.gridSize - 1 && this.grid[row][col + 1] === value) return;
            }
        }
        
        this.add.text(200, 200, 'Game Over', { font: '40px Arial', fill: '#ff0000' }).setOrigin(0.5);
        this.isGameOver = true;

        // 게임 오버 시 점수 저장
        this.sendGameDataToServlet();
        
        this.scene.start('GameOver', { score: this.score });
        
    }

    updateScore() {
        document.getElementById('scoreBox').innerText = `Score: ${this.score}`;
    }

    sendGameDataToServlet() {
        // 게임 오버 시 서버에 점수 저장 요청
        fetch("/addScore.games", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: `gameScore=${this.score}&gameId=1&gameName=2048`
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

    update() {
        if (this.isGameOver) return;

        if (this.cursor.left.isDown && !this.isKeyPressed) this.moveTiles('left');
        if (this.cursor.right.isDown && !this.isKeyPressed) this.moveTiles('right');
        if (this.cursor.up.isDown && !this.isKeyPressed) this.moveTiles('up');
        if (this.cursor.down.isDown && !this.isKeyPressed) this.moveTiles('down');

        this.isKeyPressed = this.cursor.left.isDown || this.cursor.right.isDown || this.cursor.up.isDown || this.cursor.down.isDown;
    }
}
