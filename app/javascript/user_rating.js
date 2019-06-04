const nokCheckbox = () => {
  const radioStates = {}
  const nokradioStates = {}
  const addFriend = document.querySelector("#user_review_add_friend")
  const endorse = document.querySelector("#user_review_endorse")
  const nok = document.querySelector("#user_review_nok")
  const nokDetails = document.querySelector(".nok-button")
  const nokPositive = document.querySelector(".positive")
  const nokCom = document.querySelector(".com")
  const nokHelp = document.querySelector(".help")
  const nokRespect = document.querySelector(".respect")

  nok.addEventListener('change',event => {
    if(nok.checked) {
      radioStates["endorse"] = endorse.checked
      radioStates["addFriend"] = addFriend.checked
      endorse.checked = false;
      addFriend.checked = false;
      nokDetails.classList.remove('hidden');
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
      nokDetails.classList.add('hidden');
    }
  })

addFriend.addEventListener('change',event => {
    if(addFriend.checked) {
      radioStates["nok_positiveness"] = nokPositive.checked
      radioStates["nokCom"] = nokCom.checked
      radioStates["nokHelp"] = nokHelp.checked
      radioStates["nokRespect"] = nokRespect.checked
      nok.checked = false;
      nokDetails.classList.add('hidden');
    }
  })
}

export { nokCheckbox };
