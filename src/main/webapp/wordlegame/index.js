    document.addEventListener("DOMContentLoaded", () => {
    const headerScreen = document.getElementById("header");
    const startScreen = document.getElementById("start-screen");
    const gameScreen = document.getElementById("game");
    const resultContainer = document.getElementById("result-container");

    const startGameBtn = document.getElementById("start-game-btn");
    const howToPlayBtn = document.getElementById("how-to-play-btn");
    const restartButton = document.getElementById("restart-btn");

    const modal = document.getElementById("modal");
    const closeModal = document.getElementById("close-modal");


     // 헤더 숨기기 (초기 설정)
     headerScreen.style.display = "none";
    
    // 모달 숨기기 (초기 설정)
       modal.style.display = "none";

    // 게임 시작 버튼 클릭 시
    startGameBtn.addEventListener("click", () => {
        headerScreen.style.display = "grid";
        startScreen.style.display = "none";
        gameScreen.style.display = "grid";
        resultContainer.style.display = "none";
        document.getElementById("game-buttons").style.display="block";
        startup();
    });

    //게임화면 버튼 기능 추가
    document.getElementById("back-btn").addEventListener("click", () => {
        gameScreen.style.display = "none";
        document.getElementById("game-buttons").style.display = "none";
        startScreen.style.display = "flex";
        headerScreen.style.display = "none";
    });
    

    // 게임 방법 버튼 클릭 시 모달 열기
    howToPlayBtn.addEventListener("click", () => {
        modal.style.display = "flex";
    });

    // 모달 닫기 버튼
    closeModal.addEventListener("click", () => {
        modal.style.display = "none";
    });

    // 모달 외부 클릭 시 닫기
    window.addEventListener("click", (event) => {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });

    // 게임 리스타트 버튼
    restartButton.addEventListener("click", () => {
        restartGame();
    });
});




// 게임 동작 기능 
const dictionary = ['price', 'earth', 'phone', 'noise', 'dream'];


const state = {
    secret: dictionary[Math.floor(Math.random() * dictionary.length)],
    grid: Array(6)
        .fill()
        .map(() => Array(5).fill('')),
    currentRow: 0,
    currentCol: 0,
    score: 0,
};


const gameContainer = document.getElementById("game");
const resultContainer = document.getElementById("result-container");
const resultMessage = document.getElementById("result-message");
const restartButton = document.getElementById("restart-btn");


function updateGrid() {
    for (let i = 0; i < state.grid.length; i++) {
        for (let j = 0; j < state.grid[i].length; j++) {
            const box = document.getElementById(`box${i}${j}`);
            box.textContent = state.grid[i][j];
        }
    }
}


function drawBox(container, row, col, letter = '') {
    const box = document.createElement('div');
    box.className = 'box';
    box.id = `box${row}${col}`;
    box.textContent = letter;

    container.appendChild(box);
    return box;
}

function drawGrid(container) {
    const grid = document.createElement('div');
    grid.className = 'grid';


    for (let i = 0; i < 6; i++) {
        for (let j = 0; j < 5; j++) {
            drawBox(grid, i, j);
        }
    }

    container.appendChild(grid);
}

function registerKeyboardEvents() {
    document.body.onkeydown = async (e) => {
        const key = e.key;
        if (key === 'Enter') {
            if (state.currentCol === 5) {
                const word = getCurrentWord();
                if (await isWordValid(word)) {
                    revealWord(word);
                    state.currentRow++;
                    state.currentCol = 0;
                } else {
                    alert('존재하지 않는 단어입니다~');
                }
            }
        }
        if (key === 'Backspace') {
            removeLetter();
        }
        if (isLetter(key)) {
            addLetter(key);
        }

        updateGrid();
    };
}
function getCurrentWord() {
    return state.grid[state.currentRow].join('');
}
async function isWordValid(word) {
    const response = await fetch(`https://api.dictionaryapi.dev/api/v2/entries/en/${word}`);
    return response.ok;
}


function revealWord(guess) {
    const row = state.currentRow;
    let isCorrect = true;

    for (let i = 0; i < 5; i++) {
        const box = document.getElementById(`box${row}${i}`);
        const letter = box.textContent;

        if (letter === state.secret[i]) {
            box.classList.add('right');
        } else if (state.secret.includes(letter)) {
            box.classList.add('wrong');
            isCorrect = false;
        } else {
            box.classList.add('empty');
            isCorrect = false;
        }
    }


    // 점수가 생성되는 부분
    if (isCorrect) {
        const rowScore = (10 - state.currentRow) * 10;
        state.score += rowScore;
    }

    const isWinner = state.secret === guess;
    const isGameOver = state.currentRow === 5;

    if (isWinner) {
        showResultScreen(`정답입니다! 점수: ${state.score}점`);
        sendGameDataToServlet();
    } else if (isGameOver) {
        showResultScreen(`아쉽지만 정답은 ${state.secret}였습니다. 최종 점수: ${state.score}점`);
    }

}
function sendGameDataToServlet() {
        // 게임 오버 시 서버에 점수 저장 요청
        fetch("/addScore.games", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: `gameScore=${state.score}&gameId=6&gameName=wordle`
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
function showResultScreen(message) {
    resultMessage.textContent = message;
    gameContainer.style.display = "none";
    resultContainer.style.display = "block";

    document.getElementById("game-buttons").style.display = "none";

}

function restartGame() {

    state.secret = dictionary[Math.floor(Math.random() * dictionary.length)];
    state.grid = Array(6).fill().map(() => Array(5).fill(''));
    state.currentRow = 0;
    state.currentCol = 0;
    state.score = 0;

    const existingGrid = document.querySelector(".grid");
    if (existingGrid) {
        existingGrid.remove();
    }
  
    drawGrid(gameContainer); 
    updateGrid(); 

    registerKeyboardEvents(); 

    resultContainer.style.display = "none";
    gameContainer.style.display = "grid";

    document.getElementById("game-buttons").style.display = "block";
}




function isLetter(key) {
    return key.length === 1 && key.match(/[a-z]/i);
}

function addLetter(letter) {
    if (state.currentCol === 5) return;
    state.grid[state.currentRow][state.currentCol] = letter;
    state.currentCol++;
}
function removeLetter() {
    if (state.currentCol === 0) return;
    state.grid[state.currentRow][state.currentCol - 1] = '';
    state.currentCol--;
}

function startup() {
    const game = document.getElementById('game');
    

    const existingGrid = document.querySelector(".grid");
    if (existingGrid) {
        existingGrid.remove();
    }
    
    drawGrid(game);

    registerKeyboardEvents();

}