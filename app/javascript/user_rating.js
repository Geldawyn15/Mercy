const nokCheckbox = () => {
  const radioStates = {}
  const nokradioStates = {}

  const flipcardInputs = document.querySelectorAll('.flipcard:not(.flipcard-team) input[type=checkbox]')

  const leaveComment = document.querySelector(".leave-comment")
  const teamBackArrow = document.querySelector("#team-flip")

  leaveComment.addEventListener('click', event => {
    const input = event.currentTarget
    const flippedCard = input.closest('.flipcard')
    flippedCard.classList.add('flipped')
  })

  teamBackArrow.addEventListener('click', event => {
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

    backArrow.addEventListener('click', event => {
      flippedCard.classList.remove('flipped')
    })

      if (input.classList.contains('add_friend')) {
        if(addFriend.checked) {
        nok.checked = false;
    }
      } else if (input.classList.contains('endorse')){
        nok.checked = false;
      } else if (input.classList.contains('nok')){
        endorse.checked = false;
        addFriend.checked = false;
        flippedCard.classList.toggle('flipped')
      }
    }

  flipcardInputs.forEach((flipcardInput) => {
    flipcardInput.addEventListener('change', inputClicked)
  })

  // nok.addEventListener('change',event => {
  //   if(nok.checked) {
  //     radioStates["endorse"] = endorse.checked
  //     radioStates["addFriend"] = addFriend.checked
  //     endorse.checked = false;
  //     addFriend.checked = false;
  //   }
  //   else {
  //     endorse.checked = radioStates["endorse"]
  //     addFriend.checked = radioStates["addFriend"]
  //     nokDetails.classList.add('hidden');
  //   }
  // })

//   endorse.addEventListener('change',event => {
//     if(endorse.checked) {
//       radioStates["nok_positiveness"] = nokPositive.checked
//       radioStates["nokCom"] = nokCom.checked
//       radioStates["nokHelp"] = nokHelp.checked
//       radioStates["nokRespect"] = nokRespect.checked
//       nok.checked = false;
//     }
//   })

// addFriend.addEventListener('change',event => {
//     if(addFriend.checked) {
//       radioStates["nok_positiveness"] = nokPositive.checked
//       radioStates["nokCom"] = nokCom.checked
//       radioStates["nokHelp"] = nokHelp.checked
//       radioStates["nokRespect"] = nokRespect.checked
//       nok.checked = false;
//     }
//   })

}

export { nokCheckbox };
