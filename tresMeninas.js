const images = document.querySelectorAll('.image-slider img');
const indicatorsContainer = document.querySelector('.indicators');
let currentIndex = 0;

function showImage(index) {
  images.forEach((image, i) => {
    if (i === index) {
      image.style.display = 'block';
    } else {
      image.style.display = 'none';
    }
  });
}

function updateIndicators() {
  const indicators = document.querySelectorAll('.indicators span');
  indicators.forEach((indicator, i) => {
    if (i === currentIndex) {
      indicator.classList.add('active');
    } else {
      indicator.classList.remove('active');
    }
  });
}

function prevImage() {
  currentIndex = (currentIndex - 1 + images.length) % images.length;
  showImage(currentIndex);
  updateIndicators();
}

function nextImage() {
  currentIndex = (currentIndex + 1) % images.length;
  showImage(currentIndex);
  updateIndicators();
}

images.forEach((image, i) => {
  const indicator = document.createElement('span');
  indicator.addEventListener('click', () => {
    currentIndex = i;
    showImage(currentIndex);
    updateIndicators();
  });
  indicatorsContainer.appendChild(indicator);
});

showImage(currentIndex);
updateIndicators();

/* Funções para logar */

function Logar (entrar){
  if(entrar){
    const btnEntrar=document.querySelector('.btn-entrar');
    const cardCliente=document.querySelector('.CardCliente');
    const btnSair=document.querySelector('.btn-sair');
    btnEntrar.style.display='none';
    cardCliente.style.display='inline';
    btnSair.style.display='inline';
  }else{
    const btnEntrar=document.querySelector('.btn-entrar');
    const cardCliente=document.querySelector('.CardCliente');
    const btnSair=document.querySelector('.btn-sair');
    btnEntrar.style.display='inline';
    cardCliente.style.display='none';
    btnSair.style.display='none';
  }
}


/* Função audio */

function playAudio() {
  const audio = document.getElementById('audioBrilho');
  console.log(audio);
  audio.play();
}

