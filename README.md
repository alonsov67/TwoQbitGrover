This code implements Grover's Database Search Algorithm in two Qubits It implements the logic outlined at: 
https://www.youtube.com/channel/UCMRMQh-fzwFlfY_iNLw6zLQ/videos (video #17 and following)

To run the code, go to the Operation.qs file and in the Grover () operation: 
  1. uncomment the Database Oracle you would like to use ( |00>, |01>, |10>, or |11> ) 
  2. uncomment the Grover diffusion algorithm you would like to use
  
Be mindful of this issue with Q# (*.qs files) in Visual Studio and Visual Studio Code: 
https://quantum.uservoice.com/forums/906943-setup-and-visual-studio-vs-code-integration/suggestions/34339525-visual-studio-2017-f5-run-does-not-rebuild-q-cl

Known issues: Oracle01 and Oracle10 seem to be reversed producing states |10> and |01> respectively

Enjoy!


Delbert Murphy
