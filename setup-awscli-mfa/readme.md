## Step 1
Copy the mfa.sh file into your ~/.aws folder
Make sure you make the file executable by typing the following command `chmod 777 mfa.sh` 

## Steo 2
Inside your .bashrc or .zshrc insert below line
```
alias mfa=~/.aws/mfa.sh
```

## Step 3
Type the command `export aws_profile=XXXXX`. Replace XXXXX with the actual profile name.

## Step 4
Type `mfa` to begin authentication.

## Step 5
Done, you can begin using the aws command line with the right profile.
