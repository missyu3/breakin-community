import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const text = `<p>${data.content.text}</p>`;
    const nickName = `<p>${data.user.nickname}</p>`;
    const userIcon = document.getElementById('userIcon');
    const defaultIcon = document.getElementById('defaultIcon');
    const currentUser =document.getElementById('currentUserId').textContent
    const messageUser =data.user.id
    const date = new Date();
    function userInfo(){
      if ( messageUser == currentUser) {
        return "message-content-right"
      } else {
        return "message-content-left"
      }
    }
    function toLocaleString( date )
    {
      return [
          date.getFullYear(),
          date.getMonth() + 1,
          date.getDate()
          ].join( '/' ) + ' '
          + date.getHours() + ':'
          + date.getMinutes()
          ;
    } 
    function userMessage(){
      if ( messageUser == currentUser) {
        return "lower-message-right"
      } else {
        return "lower-message-left"
      }
    }
    function icon(){
      if(defaultIcon === null){
        return userIcon
      }else{
        return defaultIcon
      };
    }
    const HTML = `
    <div class=${userInfo()}>
      <div class="message-icon">
        <img src="${icon()["src"]}" class="message-user-icon">
      </div>
      <div class="message-name">
        <p>${nickName}</p>
      </div>
      <div class="created-at">
        <p>${toLocaleString(date)}</p>
      </div>
    </div>
    <div class=${userMessage()}>
      <div class="text">
        <p>${text}</p>
      </div>
    </div>`
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('textField');
    messages.insertAdjacentHTML('afterbegin', HTML);
    newMessage.value='';
  }
});
