$(document).ready(function () {
  if ($('.samples.show').length === 0) return;
    console.log("Welcome to sample");


let $songTitle = $("#songTitle");
let $fillBar = $('#fill');


// let $song = $('#player');
// console.log($song);
// $song.play();

function initPlayer() {

  //VARIABLES
  let playerContainer = $('#player_container');
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
