xButtercream is a cute microblogging theme.

Buttercream supports all WordPress post formats and includes three different theme styles--Confetti (default), Chocolate Orange and Red Velvet. It also supports an optional responsive layout for small screens, custom flyout menus, three widget areas in the footer, and custom backgrounds.

As Buttercream is designed to be a microblog-style theme, page navigation does not show by default. However, if you'd like page navigation, simply create a custom menu under Appearance -> Menus and assign it to the Navigation area. This will create a navigation bar at the bottom of the site.

Google Web fonts used are Norican, Alegreya and Stint Ultra Condensed.

Cupcake llustrations included with this theme were created by me and licensed under the GPL.

For support, please post in the forums at http://wordpress.org/tags/buttercream?forum_id=5

-----

*** Post Format Guidelines ***

Also found here:

Please read!  Buttercream is a sleek theme out of the box, but post formats make it shine. It works seamlessly with Crowd Favorite's Post Formats Admin UI (download here: https://github.com/crowdfavorite/wp-post-formats).

If you don't have or want to use the plugin, you can also use the custom fields (keys and values) noted below.

If you don't use the custom fields, whatever you place in the post content area will be displayed instead, however it won't have any special formatting.

Here's how to make the most of your microblog with Buttercream:

---

* Audio
Key - _format_audio_embed
Value - Embed code or OEmbed URL

Insert an OEmbed link or Embed code into the custom field. You may use WordPress' native [audio] embed.  When using the [audio] shortcode, this format works best:

[audio http://myurl.com/audiofile.mp3|bgcolor=FFFFFF]

Where http://myurl.com/audiofile.mp3 is the path to your (MP3) audio file and FFFFFF is a hex color value that most closely matches the background color of your chosen theme style. For more information on how to use WordPress audio embeds, follow the guide here: http://en.support.wordpress.com/audio/

---

* Video -
Key - _format_video_embed
Value - Embed code or OEmbed URL

Insert an OEmbed link or Embed code into the custom field. For more information on embedding video in WordPress, look here: http://codex.wordpress.org/Embeds

---

* Image - Set a Featured Image, and if provided, the post title will become the image caption.

---

* Gallery - Simply insert your WordPress gallery into the content area. Your blog index page will display the first three images in the gallery followed by the post title, which links to the full gallery.

---

* Chat - Paste a chat transcript into the content area.

---

* Link -
Key - _format_link_url
Value - Link URL

The post title will be displayed as the link text. Additional content will be displayed underneath.

---

* Quote -
Key - _format_quote_source_name
Value - Name of the quote's source (optional)

Key - _format_quote_source_url
Value - Link to the source (optional)

Simply put the text you want to quote in the content area of your post.  Optionally, you can add the name of the source and a link in the custom fields above.  The quote is displayed in a blockquote format, set apart from your other posts.  No post title is displayed.

---

* Aside - Similar to a Facebook update. Paste your aside into the content area and the text will appear centered in a fancier font.  No post title is displayed.

---

* Status - Similar to a Twitter post.  Paste your status update into the content area; the text will appear with a timestamp. No post title is displayed.

-----

Version history:

v1.0.5 - Removed Google fonts from admin area. Fixed header image on non-responsive layout option.

v1.0.4 - Fixed donation button in Theme Options. Removed custom header support since it wasn't active anyway--oops!  Added PO files.

v1.0.3 - Bug fix as per theme review for .org repo.

v1.0.2 - Minor tweaks.

v1.0 - Hello world!