resource "aws_kms_key" "sample1" {
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Id": "key-S3",
    "Statement": [
        {
            "Sid": "Enable IAM User Permissions",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${var.account_id}:root"
            },
            "Action": "kms:*",
            "Resource": "*"
        },
        {
            "Sid": "Allow use of the key",
            "Effect": "Allow",
            "Principal": {
                "AWS": [
                    "${aws_iam_role.sample.arn}",
                    "${var.deploy_role_arn}"
                ]
            },
            "Action": [
                "kms:DescribeKey",
                "kms:Encrypt",
                "kms:Decrypt",
                "kms:ReEncrypt*",
                "kms:GenerateDataKey",
                "kms:GenerateDataKeyWithoutPlaintext"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_kms_alias" "sample1" {
  name          = "alias/${var.s3bucket1}"
  target_key_id = "${aws_kms_key.sample1.key_id}"
}

resource "aws_kms_key" "sample2" {
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Id": "key-S3",
    "Statement": [
        {
            "Sid": "Enable IAM User Permissions",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${var.account_id}:root"
            },
            "Action": "kms:*",
            "Resource": "*"
        },
        {
            "Sid": "Allow use of the key",
            "Effect": "Allow",
            "Principal": {
                "AWS": [
                    "${aws_iam_role.sample.arn}",
                    "${var.deploy_role_arn}"
                ]
            },
            "Action": [
                "kms:DescribeKey",
                "kms:Encrypt",
                "kms:Decrypt",
                "kms:ReEncrypt*",
                "kms:GenerateDataKey",
                "kms:GenerateDataKeyWithoutPlaintext"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_kms_alias" "sample2" {
  name          = "alias/${var.s3bucket2}"
  target_key_id = "${aws_kms_key.sample2.key_id}"
}

resource "aws_kms_key" "sample3" {
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Id": "key-S3",
    "Statement": [
        {
            "Sid": "Enable IAM User Permissions",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${var.account_id}:root"
            },
            "Action": "kms:*",
            "Resource": "*"
        },
        {
            "Sid": "Allow use of the key",
            "Effect": "Allow",
            "Principal": {
                "AWS": [
                    "${aws_iam_role.sample.arn}",
                    "${var.deploy_role_arn}"
                ]
            },
            "Action": [
                "kms:DescribeKey",
                "kms:Encrypt",
                "kms:Decrypt",
                "kms:ReEncrypt*",
                "kms:GenerateDataKey",
                "kms:GenerateDataKeyWithoutPlaintext"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_kms_alias" "sample3" {
  name          = "alias/${var.s3bucket3}"
  target_key_id = "${aws_kms_key.sample3.key_id}"
}
