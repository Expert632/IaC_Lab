# main.tf
# Exemple simplifié d'infrastructure AWS volontairement vulnérable
# ATTENTION : Ne pas appliquer en production. Lab pédagogique uniquement.

provider "aws" {
  region = "us-east-1"
}

# Groupe de sécurité avec règle très dangereuse : tout le monde peut se connecter sur le port 22
resource "aws_security_group" "insecure_sg" {
  name        = "insecure_sg"
  description = "Security group with overly permissive ingress rule"

  ingress {
    description = "Allow SSH from everywhere (DANGEROUS)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Vulnérabilité critique : accès SSH ouvert au monde entier
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Instance EC2 sans chiffrement du disque et utilisant le SG dangereux
resource "aws_instance" "insecure_instance" {
  ami           = "ami-0c02fb55956c7d316" # Exemple d'AMI publique (region us-east-1)
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.insecure_sg.id]

  # Pas de chiffrement explicite du volume
  root_block_device {
    volume_size = 8
    encrypted   = false # Mauvaise pratique : disque non chiffré
  }

  # Pas de tags, pas de gestion sérieuse
}
