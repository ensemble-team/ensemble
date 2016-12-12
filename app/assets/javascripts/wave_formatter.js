//establish all var that the js will use
var audio, canvas, ctx, source, context, analyser, fbc_array, bars, bar_x, bar_width, bar_height;
// initializa the MP£ player after the oage is fully loaded
window.addEventListener("load", initMp3Player, false);

function initMp3Player(){
  audio = document.getElementById('audio_player');
  context = new AudioContext(); // AudioContext object instance
  analyser = context.createAnalyser(); // AnalyserNode method
  canvas = document.getElementById('analyser_render');
  ctx = canvas.getContext('2d');
  // Re-route audio playback into the processing graph of the AudioContext
  source = context.createMediaElementSource(audio);
  source.connect(analyser); //connects the the analyser var to the source media element
  analyser.connect(context.destination); //the destination of the context is the speakers
  frameLooper();
}

//frameLooper() animates any style of graphics you want to the audio frquency
//looping at the defaut frame rate that the browser provides (approx. 60 FPS)

function frameLooper(){
  window.requestAnimationFrame(frameLooper);
  fbc_array = new Uint8Array(analyser.frequencyBinCount);
  analyser.getByteFrequencyData(fbc_array);
  ctx.clearRect(0, 0, canvas.width, canvas.height); // Clear the canvas
  ctx.fillStyle = '#00CCFF'; // Color of the bars
  bars = 100;
  for (var i = 0; i < bars; i++) {
    bar_x = i * 3;
    bar_width = 2;
    bar_height = -(fbc_array[i] / 2);
    //  fillRect( x, y, width, height ) // Explanation of the parameters below
    ctx.fillRect(bar_x, canvas.height, bar_width, bar_height);
  }
}
