# Week 7 Bonus: S3 Pre-Signed URLs
- Generated pre-signed URL for `avatars/user_default.png` in `grocerymate-avatars-kb-1234`.
- Command: `aws s3 presign s3://grocerymate-avatars-kb-1234/avatars/user_default.png --region eu-central-1 --expires-in 3600`
- URL: https://grocerymate-avatars-kb-1234.s3.eu-central-1.amazonaws.com/avatars/user_default.png?X-Amz-...
- Purpose: Allows temporary, secure access to private S3 objects.
- Tested: Image accessible in browser, expires after 1 hour.
