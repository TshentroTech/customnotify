const notifications = document.querySelector(".notifications");
let globalMute = false;

const removeToast = (toast) => {
  if (toast) {
    toast.classList.add("hide");
    if (toast.timeoutId) clearTimeout(toast.timeoutId);
    setTimeout(() => toast.remove(), 500); // Smooth removal after 500ms
  }
};

const createToast = (id, details, notify) => {
  // var sound = new Audio(notify["sound"]);
  // sound.volume = notify["volume"];

  // function playSound() {
  //   if (!globalMute && !notify["mute"]) {
  //     sound.play();
  //   }
  // }

  // Remove any existing toast before creating a new one
  const existingToast = notifications.querySelector(".toast");
  if (existingToast) {
    removeToast(existingToast);
  }

  // Create new notification
  const toast = document.createElement("li");
  var toastId = (Math.random() + 1).toString(36).substring(4);
  toast.className = `toast ${id}`;
  toast.id = toastId;

  const { icon, color } = notify;
  const messageContent = details.text;

  toast.innerHTML = `
        <div class="icon" style="color:rgb(0, 255, 242);">
            <i class="fa ${icon}"></i>
        </div>
        <div class="message">
            <span class="text">${messageContent}</span>
        </div>
    `;

  notifications.appendChild(toast);
  toast.timeoutId = setTimeout(() => removeToast(toast), details.time);

  // playSound();
};

function testNotification(id, details, notify) {
  createToast(id, details, notify);
}

window.addEventListener("message", function (event) {
  switch (event.data.action) {
    case "notify":
      createToast(event.data.type, event.data, event.data.details);
      break;
    case "setGlobalMute":
      globalMute = event.data.globalMute === true;
      break;
    case "testNotify":
      testNotification(event.data.type, event.data, event.data.details);
      break;
  }
});

$(() => {
  $.post("https://abl-customnotify/nui-ready");
});
