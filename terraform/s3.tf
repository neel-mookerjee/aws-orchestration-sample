resource "aws_s3_bucket" "sample1" {
  bucket = "${var.s3bucket1}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.sample1.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${var.account_id}:root"
            },
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::${var.s3bucket1}/*"
        },
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "${var.deploy_role_arn}"
            },
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::${var.s3bucket1}/*"
        },
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "${aws_iam_role.sample.arn}"
            },
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion"
            ],
            "Resource": "arn:aws:s3:::${var.s3bucket1}/*"
        },
        {
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::${var.s3bucket1}/*",
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
            }
        }
    ]
}
EOF
}

resource "aws_s3_bucket" "sample2" {
  bucket = "${var.s3bucket2}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.sample2.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${var.account_id}:root"
            },
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::${var.s3bucket2}/*"
        },
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "${var.deploy_role_arn}"
            },
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::${var.s3bucket2}/*"
        },
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "${aws_iam_role.sample.arn}"
            },
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion"
            ],
            "Resource": "arn:aws:s3:::${var.s3bucket2}/*"
        },
        {
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::${var.s3bucket2}/*",
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
            }
        }
    ]
}
EOF
}

resource "aws_s3_bucket" "sample3" {
  bucket = "${var.s3bucket3}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.sample3.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${var.account_id}:root"
            },
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::${var.s3bucket3}/*"
        },
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "${var.deploy_role_arn}"
            },
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::${var.s3bucket3}/*"
        },
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "${aws_iam_role.sample.arn}"
            },
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion"
            ],
            "Resource": "arn:aws:s3:::${var.s3bucket3}/*"
        },
        {
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::${var.s3bucket3}/*",
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
            }
        }
    ]
}
EOF
}

