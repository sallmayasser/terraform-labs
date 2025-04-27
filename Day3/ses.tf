resource "aws_ses_email_identity" "from" {
  email = "sallma.yasser.abdulla@gmail.com"
}

resource "aws_ses_email_identity" "to" {
  email = "yassersalma56@gmail.com"
}
