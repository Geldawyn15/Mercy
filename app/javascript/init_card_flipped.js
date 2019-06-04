const toogleFaces = (elemFace) => {
  elemFace.classList.toggle('flipped')
}


const initCardFlipped = () => {
  const cards = document.querySelectorAll('.flip-card-user-review')

  cards.forEach( (card, index) => {
    card.querySelector('.fire').addEventListener('click', (e) => {
      toogleFaces(e.currentTarget.closest('.faces'))
    })
    card.querySelector('.close').addEventListener('click', (e) => {
      toogleFaces(e.currentTarget.closest('.faces'))
    })
  })
}

export { initCardFlipped }
