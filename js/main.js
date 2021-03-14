let xhr1mb = document.querySelector('.btn.onemeg');
let xhr100mb = document.querySelector('.btn.hundredmeg');
let xhr1gb = document.querySelector('.btn.onegig');
let log = document.querySelector('.log');

let bar = document.querySelector('.loadbar');

let time = 0;
let avg = 0;
let count = 0;


function addListeners(xhr) {
    xhr.addEventListener('loadstart', (e) => {
        time = Date.now();
    });
    xhr.addEventListener('progress', (e) => {
        let now = Date.now();
        let elapsed = now - time;
        avg += e.loaded/elapsed;
        if( avg > 0 ){
            avg /= 2;
        }
        log.style.width = `${(e.loaded/e.total*100).toPrecision(5)}%`;
        log.innerHTML = `Percentage: ${(e.loaded/e.total*100).toPrecision(5)}<br>Speed: ${(avg/1000).toPrecision(5)}Mbps`;
        
        console.log(`I have downloaded ${(e.loaded/e.total*100).toPrecision(5)}% in ${elapsed} milliseconds`);
        console.log(`I think the speed is ${avg}`);
    });
    xhr.addEventListener('loadend', (e) => {
        let now = Date.now();
        let elapsed = now - time;
        console.log(e);
        console.log(`I have finished downloading ${e.total} in ${elapsed} milliseconds`);
    });
}

function runXHR(url) {
    log.innerHTML = '';
    
    const xhr = new XMLHttpRequest();
    addListeners(xhr);
    xhr.open('GET', url);
    xhr.send();
    return xhr;

}

xhr1mb.addEventListener('click', () => {
    console.log('1m test');
    runXHR('files/1MB.bin');
});

xhr100mb.addEventListener('click', () => {
    runXHR('files/100MB.bin');
});

xhr1gb.addEventListener('click', () => {
    runXHR('files/1GB.bin');
});
