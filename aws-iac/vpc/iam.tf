resource "aws_iam_policy" "restrict-ip-policy" {
  name        = "restrict-ip-policy"
  path        = "/"
  description = "My test policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Deny",
      "Action" : "*",
      "Resource" : "*",
      "Condition" : {
        "NotIpAddress" : {
          "aws:SourceIp" : [
            "49.144.69.163/32"
          ]
        }
      }
    }]
    }
  )
}

resource "aws_iam_role" "restrict-to-myIP-role" {
  name               = "restrict-to-myIP-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::605134463494:user/devops-nricoyanaws" 

      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach-restrict-ip-policy" {
  role       = aws_iam_role.restrict-to-myIP-role.name
  policy_arn = aws_iam_policy.restrict-ip-policy.arn
}
resource "aws_iam_role_policy_attachment" "attach-awsmanaged-policy1" {
  role       = aws_iam_role.restrict-to-myIP-role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
resource "aws_iam_role_policy_attachment" "attach-awsmanaged-policy2" {
  role       = aws_iam_role.restrict-to-myIP-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "attach-restrict-ip-policy3" {
  role       = aws_iam_role.restrict-to-myIP-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "attach-restrict-ip-policy4" {
  role       = aws_iam_role.restrict-to-myIP-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}

resource "aws_iam_role_policy_attachment" "attach-restrict-ip-policy5" {
  role       = aws_iam_role.restrict-to-myIP-role.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}
