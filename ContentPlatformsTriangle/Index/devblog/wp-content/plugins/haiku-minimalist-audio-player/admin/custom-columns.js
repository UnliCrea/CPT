/**
 *  applies saved/updated custom colors to player previews in admin columns
 */
;(function($){

    var custom_players = $('#the-list').find('.type-custom-player')

    custom_players.each(function(){

        var customID = this.id.match(/post-(\d+)/)[1];
        var opts, box, player, seek, seekbar, playbar, buttons, time
        
        // main vars
        eval('opts = haiku_player_' + customID)
        player = $(this).find('.haiku-graphical-container')
        seek = player.find('.haiku-seek-bar')
        seekbar = player.find('.haiku-seek-container')
        playbar = player.find('.haiku-play-bar'),
        buttons = player.find('a.haiku-play, a.haiku-pause, a.haiku-stop')
        time  = player.find('.haiku-time-holder')

        // same as defaults in custom-player.js
        player.css({ 'background-color': opts.custom_bg })
        seek.css({ 'border-top': '5px solid '+ opts.custom_bg + '', 'border-bottom': '5px solid '+ opts.custom_bg + '' })
        buttons.css({'color': opts.custom_gui })
        seek.css({'background-color': opts.custom_gui })
        playbar.css({'background-color': opts.custom_gui })
        seekbar.css({'background-color': opts.custom_gui })
        time.css({'color': opts.custom_time })
    
    })

})(jQuery);