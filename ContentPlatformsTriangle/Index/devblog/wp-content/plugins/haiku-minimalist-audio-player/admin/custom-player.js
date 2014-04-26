/**
 *  Applies saved/updated custom colors to custom players
 */
;(function($) {

    var opts, box, player, seek, seekbar, playbar, buttons, time

    // main vars
    opts = haiku_custom_opts
    box = $('#haiku_pro_custom_player_meta_box')
    player = $('.haiku-graphical-container')
    seek = player.find('.haiku-seek-bar')
    seekbar = player.find('.haiku-seek-container')
    playbar = player.find('.haiku-play-bar'),
    buttons = player.find('a.haiku-play, a.haiku-pause, a.haiku-stop')
    time  = player.find('.haiku-time-holder')

    // previously-saved colors
    player.css({ 'background-color': opts.custom_bg })
    seek.css({ 
        'border-top': '5px solid '+ opts.custom_bg + '', 
        'border-bottom': '5px solid '+ opts.custom_bg + '' 
    })
    buttons.css({'color': opts.custom_gui })
    seek.css({'background-color': opts.custom_gui })
    playbar.css({'background-color': opts.custom_gui })
    seekbar.css({'background-color': opts.custom_gui })
    time.css({'color': opts.custom_time })

    /**
     *  background
     */
    box.find('.custom-bg').miniColors({
        change: function(hex,rgb) {
            player.css({'background-color': hex})
            seek.css({
                'border-top': '5px solid '+ hex + '', 
                'border-bottom': '5px solid '+ hex + ''
            })
        }
    })

    /**
     *  gui
     */
   box.find('.custom-gui').miniColors({
        change: function(hex,rgb) {
            buttons.css({'color': hex})
            seek.css({'background-color': hex})
            playbar.css({'background-color': hex})
            seekbar.css({'background-color': hex})
        }
    })

    /**
     *  time
     */
    box.find('.custom-time').miniColors({
        change: function(hex,rgb) {
            time.css({'color': hex})
        }
    })

})(jQuery);