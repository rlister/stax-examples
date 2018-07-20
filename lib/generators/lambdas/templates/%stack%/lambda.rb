## read file containing lambda code
code = File.read(File.join(File.dirname(__FILE__), 'lambda.js'))

## create a lambda for each table
resource :lambda, 'AWS::Lambda::Function', DependsOn: :iamlambda do
  # environment(
  #   Variables: {
  #     VAR_NAME: 'VALUE'
  #   }
  # )
  code(
    ZipFile: code
  )
  handler 'index.handler' # needed for inline code
  runtime 'nodejs6.10'
  role Fn::get_att(:iamlambda, :Arn)
end
