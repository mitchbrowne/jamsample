$(document).ready(function () {
  if ($('.samples.show').length === 0) return;
    console.log("Welcome to sample");


let $songTitle = $("#songTitle");
let $fillBar = $('#fill');


// let $song = $('#player');
// console.log($song);
// $song.play();

function calculateTotalValue(length) {
  var minutes = Math.floor(length / 60),
    seconds_int = length - minutes * 60,
    seconds_str = seconds_int.toString(),
    seconds = seconds_str.substr(0, 2),
    time = minutes + ':' + seconds

  return time;
}

function calculateCurrentValue(currentTime) {
  var current_hour = parseInt(currentTime / 3600) % 24,
    current_minute = parseInt(currentTime / 60) % 60,
    current_seconds_long = currentTime % 60,
    current_seconds = current_seconds_long.toFixed(),
    current_time = (current_minute < 10 ? "0" + current_minute : current_minute) + ":" + (current_seconds < 10 ? "0" + current_seconds : current_seconds);

  return current_time;
}

function initPlayer() {

  //VARIABLES
  let playerContainer = $('#audio_wrapper');
  let player = $('#player');
  let isPlaying = false;
  let playButton = $('#play');

  //CONTROL LISTENERS
  if (playButton != null) {
    playButton.click(function() {
      togglePlay()
    });
  };

  //CONTROLS & SOUNDS METHODS
  function togglePlay() {
    if (player.get(0).paused === false) {
      player.get(0).pause();
      isPlaying = false;
      $('#play').removeClass('player_pause').addClass('player_play');
    } else {
      player.get(0).play();
      $('#play').removeClass('player_play').addClass('player_pause');
      isPlaying = true;
    }
  }

  //PROGRESS BAR ONTIMEUPDATE
  function initProgressBar() {
    let length = player.get(0).duration;
    let current_time = player.get(0).currentTime;

    //calculate total length of value
    let totalLength = calculateTotalValue(length);
    $('.end-time').html(totalLength);

    //calculate current value time
    currentTime = calculateCurrentValue(current_time);
    $('.start-time').html(currentTime);

    let progressBar = $('#seekbar');
    progressBar.attr('value', player.get(0).currentTime / player.get(0).duration);
    console.log(progressBar.value)
    progressBar.click(seek);

    if (player.get(0).currentTime == player.get(0).duration) {
      $('#play').removeClass('player_pause').addClass('player_play');
    }

    function seek(evt) {
      let percent = evt.offsetX / this.offsetWidth;
      player.get(0).currentTime = percent * player.get(0).duration;
      progressBar.value = percent / 100;
    };

  };

  player.on('timeupdate', function() {
    initProgressBar()
  });
};

initPlayer();

// window.onload = setSong; //calls function playSong when window loads

// function setSong() {
//   song.src = $('.hidden_audio_file').text(); //set the source of 0th song
//   console.log(song.src)
// }
//
// function playOrPauseSong() {
//   if(song.paused){
//     song.play();
//     $('#play').removeClass('player_play').addClass('player_pause');
//   } else{
//     song.pause();
//     $('#play').removeClass('player_pause').addClass('player_play');
//   };
// };
//
// $('#play').click(function() {
//   console.log("HEY")
//   playOrPauseSong();
// });
//
//
//
// song.ontimeupdate = function() {
//   $('#seekbar').attr('value', song.currentTime / song.duration);
//   console.log(song.currentTime / song.duration)
//   // let position = song.currentTime / song.duration;
//   // $fillBar.css('width',`${position * 100}%`);
// };
//
// function replay() {
//   playSong();
//   $("#play img").attr("src","https://raw.githubusercontent.com/DaftCreation/Custom-Audio-Player/master/Pause.png")
// }
//
// $('#pre').click(function() {
//   console.log("YOU")
//   replay();
// })

});
