void main()
{
	List myList = [2, 5, 1, 3, 7];
	print("List : $myList");
  
	myList = myList.reversed.toList();
	print("Reversed List : ${myList}");
}