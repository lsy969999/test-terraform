resource "aws_s3_bucket" "test-lsy-s3-tf-state" {

  bucket = "test-lsy-s3-tf-state"

  tags = {
    "Name" = "test-lsy-s3-tf-state"
  }
  
}

resource "aws_dynamodb_table" "test-lsy-ddb-tf-lock" {

  depends_on   = [aws_s3_bucket.test-lsy-s3-tf-state]
  name         = "test-lsy-ddb-tf-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "test-lsy-ddb-tf-lock"
  }

}