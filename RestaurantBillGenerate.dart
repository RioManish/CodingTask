
//Create menu item model 

class MenuItem {
  String name;
  double price;

  MenuItem(this.name, this.price);
}

//Create group item  

class Group {
  String name;
  List<MenuItem> items;
  double discount;
  double tab;

  Group(this.name, this.items, this.discount, this.tab);
}

//Calculate the group menuitem amount 
//Generate the bill based on 


class RestaurantBill {
  List<Group> groups;

  RestaurantBill(this.groups);

  void displayInvoice() {
    double totalAmount = 0;
    double totalTax = 0;
    double totalSurcharge = 0;

    for (var group in groups) {
      double groupTotal = 0;
      double groupTax = 0;

      for (var item in group.items) {
        groupTotal += item.price;
        groupTax += 0.1 * item.price; // Assuming 10% tax
      }

      double groupAmount = groupTotal + groupTax;
      if (group.discount > 0) {
        groupAmount -= group.discount;
      }

      totalAmount += groupAmount;
      totalTax += groupTax;
      totalSurcharge += (groupAmount * 0.012); // 1.2% surcharge

      print("Group ${group.name} Bill:");
      for (var item in group.items) {
        print("${item.name} \$${item.price}");
      }

      print("Subtotal: \$${groupTotal.toStringAsFixed(2)}");
      print("Tax: \$${groupTax.toStringAsFixed(2)}");
      print("Discount: \$${group.discount.toStringAsFixed(2)}");
      print("Total: \$${groupAmount.toStringAsFixed(2)}");

      if (groupAmount > group.tab) {
        double change = groupAmount - group.tab;
        print("Paid: \$${group.tab.toStringAsFixed(2)}, returned: \$${change.toStringAsFixed(2)}");
      } else {
        double remaining = group.tab - groupAmount;
        print("Paid: \$${groupAmount.toStringAsFixed(2)}, remaining: \$${remaining.toStringAsFixed(2)}");
      }

      print("\n");
    }

    print("Total Amount: \$${totalAmount.toStringAsFixed(2)}");
    print("Total Tax: \$${totalTax.toStringAsFixed(2)}");
    print("Total Surcharge: \$${totalSurcharge.toStringAsFixed(2)}");
  }
}

void main() {
  var group1 = Group("1", [
    MenuItem("Big Brekkie", 16),
    MenuItem("Big Brekkie", 16),
    MenuItem("Bruchetta", 8),
    MenuItem("Poached Eggs", 12),
    MenuItem("Coffee", 5),
    MenuItem("Tea", 3),
    MenuItem("Soda", 4),
  ], 0, 0);

  var group2 = Group("2", [
    MenuItem("Tea", 3),
    MenuItem("Coffee", 3),
    MenuItem("Soda", 4),
    MenuItem("Big Brekkie", 16),
    MenuItem("Poached Eggs", 12),
    MenuItem("Garden Salad", 10),
  ], 0.1 * 0.1 * 90, 0);

  var group3 = Group("3", [
    MenuItem("Tea", 3),
    MenuItem("Coffee", 3),
    MenuItem("Soda", 4),
    MenuItem("Bruchetta", 8),
    MenuItem("Big Brekkie", 16),
    MenuItem("Poached Eggs", 12),
    MenuItem("Garden Salad", 10),
  ], 25, 50);

  var bill = RestaurantBill([group1, group2, group3]);
  bill.displayInvoice();
}
