const nokCheckbox = () => {
  const radioStates = {}
  const nokradioStates = {}

  const flipcardInputs = document.querySelectorAll('.flipcard:not(.flipcard-team) input[type=checkbox]')

  const leaveComment = document.querySelector(".leave-comment")
  const teamBackArrow = document.querySelector("#team-flip")

  leaveComment.addEventListener('click', event => {
    console.log("je suis dans comment")
    const input = event.currentTarget
    const flippedCard = input.closest('.flipcard')
    flippedCard.classList.add('flipped')
  })

  teamBackArrow.addEventListener('click', event => {
    console.log("je suis dans back arrow")
    document.querySelector(".flipcard-team").classList.remove('flipped')
  })

  const inputClicked = (event) => {
    const input = event.currentTarget
    const flippedCard = input.closest('.flipcard')
    const addFriend = flippedCard.querySelector(".add_friend")
    const endorse = flippedCard.querySelector(".endorse")
    const nok = flippedCard.querySelector(".nok")
    const nokPositive = flippedCard.querySelector(".nok_positiveness")
    const nokCom = flippedCard.querySelector(".nok_communication")
    const nokHelp = flippedCard.querySelector(".nok_helpfulness")
    const nokRespect = flippedCard.querySelector(".nok_respect")
    const backArrow = flippedCard.querySelector(".fas.fa-undo-alt")
    // console.log(event.currentTarget)
    // console.log(flippedCard)
    // console.log(event.currentTarget)
    // console.log(endorse)
    // console.log(addFriend)
    // console.log(endorse)
    // console.log(nok)
    // console.log(nokPositive)
    // console.log(nokCom)
    // console.log(nokHelp)
    // console.log(nokRespect)
    // console.log(backArrow)


    backArrow.addEventListener('click', event => {
      console.log("je suis dans back arrow")
      console.log(flippedCard)
      flippedCard.classList.remove('flipped')
    })

      if (input.classList.contains('add_friend')) {
        if(addFriend.checked) {
        console.log("je suis dans add_friend")
        console.log(addFriend)
        // radioStates["nokCom"] = nokCom.checked
        // radioStates["nokHelp"] = nokHelp.checked
        // radioStates["nokRespect"] = nokRespect.checked
        nok.checked = false;
    }
      } else if (input.classList.contains('endorse')){
        console.log("je suis dans endorse")
      } else if (input.classList.contains('nok')){
        console.log("je suis dans nok")
        endorse.checked = false;
        addFriend.checked = false;
        flippedCard.classList.toggle('flipped')
      }
    }

    flipcardInputs.forEach((flipcardInput) => {
      flipcardInput.addEventListener('change', inputClicked)
    })

  nok.addEventListener('change',event => {
    if(nok.checked) {
      radioStates["endorse"] = endorse.checked
      radioStates["addFriend"] = addFriend.checked
      endorse.checked = false;
      addFriend.checked = false;
    }
    else {
      endorse.checked = radioStates["endorse"]
      addFriend.checked = radioStates["addFriend"]
      nokDetails.classList.add('hidden');
    }
  })

  endorse.addEventListener('change',event => {
    if(endorse.checked) {
      radioStates["nok_positiveness"] = nokPositive.checked
      radioStates["nokCom"] = nokCom.checked
      radioStates["nokHelp"] = nokHelp.checked
      radioStates["nokRespect"] = nokRespect.checked
      nok.checked = false;
    }
  })

addFriend.addEventListener('change',event => {
    if(addFriend.checked) {
      radioStates["nok_positiveness"] = nokPositive.checked
      radioStates["nokCom"] = nokCom.checked
      radioStates["nokHelp"] = nokHelp.checked
      radioStates["nokRespect"] = nokRespect.checked
      nok.checked = false;
    }
  })



}



export { nokCheckbox };
