//
//  TableViewController.swift
//  TableVNavController
//
//  Created by Хамза Кабылбек on 28.06.2024.
//

import UIKit

class TableViewController: UITableViewController {

    
    var arrayPersons =
                        [Person(name: "1+1", 
                                surname: "2011",
                                ImageName: "600x900 1+1",
                                proKino: "Пострадав в результате несчастного случая, богатый аристократ Филипп нанимает в помощники человека, который менее всего подходит для этой работы, – молодого жителя предместья Дрисса, только что освободившегося из тюрьмы. Несмотря на то, что Филипп прикован к инвалидному креслу, Дриссу удается привнести в размеренную жизнь аристократа дух приключений."),
                        
                        Person(name: "Интерстеллар",
                               surname: "2014",
                               ImageName: "600x900Интерстеллар",
                               proKino: "Когда засуха, пыльные бури и вымирание растений приводят человечество к продовольственному кризису, коллектив исследователей и учёных отправляется сквозь червоточину (которая предположительно соединяет области пространства-времени через большое расстояние) в путешествие, чтобы превзойти прежние ограничения для космических путешествий человека и найти планету с подходящими для человечества условиями."),
                        
                        Person(name: "Зеленая миля", 
                               surname: "1999",
                               ImageName: "600x900Зеленая миля",
                               proKino: "Пол Эджкомб — начальник блока смертников в тюрьме «Холодная гора», каждый из узников которого однажды проходит «зеленую милю» по пути к месту казни. Пол повидал много заключённых и надзирателей за время работы. Однако гигант Джон Коффи, обвинённый в страшном преступлении, стал одним из самых необычных обитателей блока."),
                        
                        Person(name: "Побег из Шоушенка", 
                               surname: "1994",
                               ImageName: "600x900Побег из Шоушенка",
                               proKino: "Бухгалтер Энди Дюфрейн обвинён в убийстве собственной жены и её любовника. Оказавшись в тюрьме под названием Шоушенк, он сталкивается с жестокостью и беззаконием, царящими по обе стороны решётки. Каждый, кто попадает в эти стены, становится их рабом до конца жизни. Но Энди, обладающий живым умом и доброй душой, находит подход как к заключённым, так и к охранникам, добиваясь их особого к себе расположения."),
                        
                        Person(name: "Бойцовский клуб",
                               surname: "1999",
                               ImageName: "600x900Бойцовский клуб",
                               proKino: "Сотрудник страховой компании страдает хронической бессонницей и отчаянно пытается вырваться из мучительно скучной жизни. Однажды в очередной командировке он встречает некоего Тайлера Дёрдена — харизматического торговца мылом с извращенной философией. Тайлер уверен, что самосовершенствование — удел слабых, а единственное, ради чего стоит жить, — саморазрушение.Проходит немного времени, и вот уже новые друзья лупят друг друга почем зря на стоянке перед баром, и очищающий мордобой доставляет им высшее блаженство. Приобщая других мужчин к простым радостям физической жестокости, они основывают тайный Бойцовский клуб, который начинает пользоваться невероятной популярностью.")]
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    
//    @IBAction func addPerson(_ sender: Any) {
//        arrayPersons.append(Person(name: "Khamza", surname: "Kabylbek", ImageName: "avatar"))
//        tableView.reloadData()
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPersons.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let labelName = cell.viewWithTag(1000) as! UILabel
        labelName.text = arrayPersons[indexPath.row].name
        
        let labelSurname = cell.viewWithTag(1001) as! UILabel
        labelSurname.text = arrayPersons[indexPath.row].surname
        
        let imageContact = cell.viewWithTag(1002) as! UIImageView
        imageContact.image = UIImage(named: arrayPersons[indexPath.row].ImageName)
        imageContact.layer.cornerRadius = 15
        
//        let labelProKino = cell.viewWithTag(1003) as! UILabel
//        labelProKino.text = arrayPersons[indexPath.row].proKino
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(identifier: "detailViewController") as! ViewController
        
        navigationController?.show(detailVC, sender: self)
        
        detailVC.name = arrayPersons[indexPath.row].name
        detailVC.surname = arrayPersons[indexPath.row].surname
        detailVC.ImageName = arrayPersons[indexPath.row].ImageName
        detailVC.proKino = arrayPersons[indexPath.row].proKino
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrayPersons.remove(at: indexPath.row)
//            arrayPersons.remove(at: indexPath.row).surname
//            arrayPersons.remove(at: indexPath.row).ImageName

            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
