const XLSX = require("xlsx");
import {ethers} from "ethers" ;
const app = async () => 
{

var name , category ;
var rank , address ;
const provider = new ethers.providers.Web3Provider(ethereum);
          const signer = provider.getSigner();
          const contract = new ethers.Contract(
            contractAddress,
            contractABI,
            signer
          );

          const readExcel = require('read-excel-file/node')
          readExcel('./sample.xlsx').then((data) => {
            for (i in data)
             {
              for (j in data[i])
               {
                console.log(data[i][j])
                if (j==0)
                    {name == data[i][j];}
                else if (j==1)
                {category = data[i][j];}  
                else if (j == 2 )
                {rank = data[i][j];} 
                else 
                address = data[i][j] ;
                }
                contract.issue(address ,name , category , rank ) ;
            }
          })
    
        }

        export default app ;