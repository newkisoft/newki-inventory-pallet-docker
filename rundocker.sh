sudo docker stop $(sudo docker ps -aq -f name=inventory-pallet)
sudo docker rm $(sudo docker ps -aq -f name=inventory-pallet) 
#sudo docker rmi newki/inventory-pallet:1.1 
sudo docker build -t newki/inventory-features:1.1  . 
sudo docker run --name inventory-pallet --network host -i -d newki/inventory-features:1.1 
sudo docker exec -w / inventory-pallet git clone https://github.com/newkisoft/newki-inventory-pallet-docker.git
sudo docker exec -d -w /newki-inventory-pallet-publish/ inventory-pallet cp appsettings.live.json appsettings.json
sudo docker exec -d -w /newki-inventory-pallet-publish/ inventory-pallet dotnet newki-inventory-pallet.dll 

