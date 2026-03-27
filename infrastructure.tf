provider "aws" {
  access_key = "MINHA_CHAVE_FIXA"   # ❌ credencial hardcoded
  secret_key = "SEGREDO_FIXO"       # ❌ credencial hardcoded
  region     = "us-east-1"
}

resource "aws_s3_bucket" "inseguro" {
  bucket = "bucket-publico-teste"
  acl    = "public-read"            # ❌ acesso público
}

resource "aws_security_group" "sg_inseguro" {
  name        = "sg-inseguro"
  description = "Security group aberto"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]     # ❌ SSH aberto para o mundo
  }
}
