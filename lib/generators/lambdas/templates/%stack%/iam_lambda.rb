resource :iamlambda, 'AWS::IAM::Role' do
  # path '/project-name/'

  assume_role_policy_document(
    Version: '2012-10-17',
    Statement: [
      {
        Effect: 'Allow',
        Principal: {
          Service: 'lambda.amazonaws.com'
        },
        Action: 'sts:AssumeRole'
      }
    ]
  )
  managed_policy_arns(
    [
      'arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole'
    ]
  )
end
