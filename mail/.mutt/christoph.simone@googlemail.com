set spoolfile = "+christoph.simone@googlemail.com/INBOX"
unset record
set postponed = "+christoph.simone@googlemail.com/Drafts"

set realname  = "Christoph & Simone Weinsheimer"
set from      = christoph.simone@googlemail.com
unset signature

set imap_user = christoph.simone@gmail.com
set imap_pass = `pass google2oauth/defiant/christoph.simone@googlemail.com`
set smtp_url  = smtps://$imap_user:$imap_pass@smtp.gmail.com:465
