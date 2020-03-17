$(document).ready(function () {
  if ($('.samples.show').length === 0) return;
    console.log("Welcome to sample");

let songs = ["https://ia800309.us.archive.org/15/items/Dje-AShortLoopWithTheRc-20xl/Dje.mp3"]
let poster = ["https://i.pinimg.com/originals/5d/97/b8/5d97b8478ab7fefd6af1b85225640e6d.jpg"]

let $songTitle = $("#songTitle");
let $fillBar = $('#fill');

let song = new Audio();
let currentSong = 0; //points to current song

window.onload = setSong; //calls function playSong when window loads

function setSong() {
  song.src = $('.hidden_audio_file').text(); //set the source of 0th song
}

function playOrPauseSong() {
  if(song.paused){
    song.play();
    $("#play img").attr("src","https://raw.githubusercontent.com/DaftCreation/Custom-Audio-Player/master/Pause.png");
  } else{
    song.pause();
    $("#play img").attr("src", "https://raw.githubusercontent.com/DaftCreation/Custom-Audio-Player/master/Play.png")
  };
};

$('#play').click(function() {
  console.log("HEY")
  playOrPauseSong();
});

song.ontimeupdate = function() {
  let position = song.currentTime / song.duration;
  $fillBar.css('width',`${position * 100}%`);
  // $fillBar.style.width = position * 100 +'%';
};

function replay() {
  playSong();
  $("#play img").attr("src","https://raw.githubusercontent.com/DaftCreation/Custom-Audio-Player/master/Pause.png")
}

$('#pre').click(function() {
  console.log("YOU")
  replay();
})





});
