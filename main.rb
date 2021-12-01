require './toy_robot'

def main
  toy_robot = ToyRobot.new
  toy_robot.run('test.txt')
end
main()