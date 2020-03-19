$(document).ready(function () {
  if ($('.users.show').length === 0) return;

  console.log("welcome to users show")

  function calculateTotalValue(length) {
    var minutes = Math.floor(length / 60),
      seconds_int = length - minutes * 60,
      seconds_str = seconds_int.toString(),
      seconds = seconds_str.substr(0, 2),
      time = minutes + ':' + seconds;

    return time;
  };

  function calculateCurrentValue(currentTime) {
    var current_hour = parseInt(currentTime / 3600) % 24,
      current_minute = parseInt(currentTime / 60) % 60,
      current_seconds_long = currentTime % 60,
      current_seconds = current_seconds_long.toFixed(),
      current_time = (current_minute < 10 ? "0" + current_minute : current_minute) + ":" + (current_seconds < 10 ? "0" + current_seconds : current_seconds);

    return current_time;
  };

  function initPlayers() {
    for (let i = 0; i < $sample_ids.length; i++) {
      initPlayer($sample_ids[i].innerHTML);
    }
  };

  function initPlayer(sample_id) {

    console.log(sample_id);

    //VARIABLES
    let playerContainer = $(`#audio_wrapper${sample_id}`);
    let player = $(`#player${sample_id}`);
    let isPlaying = false;
    let playButton = $(`#play${sample_id}`);

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
        $(`#play${sample_id}`).removeClass('explore_player_pause').addClass('explore_player_play');
      } else {
        player.get(0).play();
        $(`#play${sample_id}`).removeClass('explore_player_play').addClass('explore_player_pause');
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

      let progressBar = $(`#seekbar${sample_id}`);
      progressBar.attr('value', player.get(0).currentTime / player.get(0).duration);
      console.log(progressBar.value)
      progressBar.click(seek);

      if (player.get(0).currentTime == player.get(0).duration) {
        $(`#play${sample_id}`).removeClass('explore_player_pause').addClass('explore_player_play');
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

  // extract all sample_ids from html explore page
  let $sample_ids = $('.hidden_id').toArray();

// initialise players when page has loaded
  initPlayers();



});
