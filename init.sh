# takes first argument as project name
if [ -z "$1" ]
  then
    echo "project name not entered. Correct usage: ./init.sh {project_name}"
    exit 1
fi
# if folder already exists on prompt user on if they want to delete project name and then create everything from scratch else
if [ -d "$1" ]; then
  echo "Project folder $1 already exists in current directory"
  while true; do

	read -p "Do you want to delete $1 in current directory? (yes/no) " yn

	case $yn in 
		yes )
		 	echo "Deleting project $1 in current directory";
			rm -r $1
			break;;
		no ) echo "Not deleting $1 in current directory. Exiting...";
			exit;;
		* ) echo "Invalid response, please respond with yes or no";;
	esac

done
fi




# creates project name folder in current directory
# creates the folders “ cmd/web pkg ui/html ui/static” in project folder
mkdir -p $1/cmd/web $1/pkg $1/ui/html $1/ui/static
touch $1/cmd/web/main.go
touch $1/cmd/web/handlers.go
cd "$1/"
echo "Successfully created project $1"
# creates the main.go file
# creates the handler.go file