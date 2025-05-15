
  export function initClock(elementId) {
    updateClock(elementId);
    setInterval(() => updateClock(elementId), 60000);
  }
  
  function updateClock(elementId) {
    const now = new Date();
    const hours = now.getHours().toString().padStart(2, '0');
    const minutes = now.getMinutes().toString().padStart(2, '0');
    const timeString = `${hours}:${minutes}`;
    const clockId = document.getElementById(elementId);
    clockId.innerText = timeString;
  }

  

