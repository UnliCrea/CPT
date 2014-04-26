<?php if (!defined('IN_PHPBB')) exit; ?>Subject: Reply Notification - "<?php echo (isset($this->_rootref['TOPIC_TITLE'])) ? $this->_rootref['TOPIC_TITLE'] : ''; ?>"
<img src="http://concernedjoe.com/Theme/Images/Email%20Headers/header_comment.png"><br><br>

Hello there <?php echo (isset($this->_rootref['USERNAME'])) ? $this->_rootref['USERNAME'] : ''; ?>,  somebody posted in the same thread as you - "<?php echo (isset($this->_rootref['TOPIC_TITLE'])) ? $this->_rootref['TOPIC_TITLE'] : ''; ?>".<br>
Click on the link below to go to that thread.<br><br>

<a href="<?php echo (isset($this->_rootref['U_NEWEST_POST'])) ? $this->_rootref['U_NEWEST_POST'] : ''; ?>"><?php echo (isset($this->_rootref['U_NEWEST_POST'])) ? $this->_rootref['U_NEWEST_POST'] : ''; ?></a><br><br>

Now go be an awesome user and reply :D <br><br>

---------------------------------<br><br>

If you don't want to receive these notifications anymore, go to our site, log in and uncheck "notifications" from the account settings page.<br>
Or click this link to go to the account settings<br><br>

<a href="http://concernedjoe.com/user">User Page</a>