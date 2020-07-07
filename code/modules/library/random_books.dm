/obj/item/book/manual/random
	icon_state = "random_book"

/obj/item/book/manual/random/Initialize()
	..()
	var/static/banned_books = list(/obj/item/book/manual/random, /obj/item/book/manual/nuclear, /obj/item/book/manual/wiki)
	var/newtype = pick(subtypesof(/obj/item/book/manual) - banned_books)
	new newtype(loc)
	return INITIALIZE_HINT_QDEL

/obj/item/book/random
	icon_state = "random_book"
	var/amount = 1
	var/category = null

/obj/item/book/random/Initialize()
	..()
	create_random_books(amount, src.loc, TRUE, category)
	return INITIALIZE_HINT_QDEL

/obj/item/book/random/triple
	amount = 3

/obj/structure/bookcase/random
	var/category = null
	var/book_count = 2
	icon_state = "random_bookcase"
	anchored = TRUE
	state = 2

/obj/structure/bookcase/random/Initialize(mapload)
	. = ..()
	if(!book_count || !isnum(book_count))
		update_icon()
		return
	book_count += pick(-1,-1,0,1,1)
	create_random_books(book_count, src, FALSE, category)
	update_icon()

/proc/create_random_books(amount, location, fail_loud = FALSE, category = null, obj/item/book/existing_book)
	. = list()
	if(!isnum(amount) || amount<1)
		return
	if (!SSdbcore.Connect())
		if(existing_book && (fail_loud || prob(5)))
			existing_book.author = "???"
			existing_book.title = "Strange book"
			existing_book.name = "Strange book"
			existing_book.dat = "There once was a book from Nantucket<br>But the database failed us, so f*$! it.<br>I tried to be good to you<br>Now this is an I.O.U<br>If you're feeling entitled, well, stuff it!<br><br><font color='gray'>~</font>"
		return
	if(prob(25))
		category = null
	var/datum/db_query/query_get_random_books = SSdbcore.NewQuery({"
		SELECT author, title, content
		FROM [format_table_name("library")]
		WHERE isnull(deleted) AND (:category IS NULL OR category = :category)
		ORDER BY rand() LIMIT :limit
	"}, list("category" = category, "limit" = amount))
	if(query_get_random_books.Execute())
		while(query_get_random_books.NextRow())
			var/obj/item/book/B
			B = existing_book ? existing_book : new(location)
			B.author	=	query_get_random_books.item[1]
			B.title		=	query_get_random_books.item[2]
			B.dat		=	query_get_random_books.item[3]
			B.name		=	"Book: [B.title]"
			if(!existing_book)
				B.icon_state=	"book[rand(1,8)]"
	qdel(query_get_random_books)

/obj/structure/bookcase/random/fiction
	name = "bookcase (Fiction)"
	category = "Fiction"
/obj/structure/bookcase/random/nonfiction
	name = "bookcase (Non-Fiction)"
	category = "Non-fiction"
/obj/structure/bookcase/random/religion
	name = "bookcase (Religion)"
	category = "Religion"
/obj/structure/bookcase/random/adult
	name = "bookcase (Adult)"
	category = "Adult"

/obj/structure/bookcase/random/reference
	name = "bookcase (Reference)"
	category = "Reference"
	var/ref_book_prob = 20

/obj/structure/bookcase/random/reference/Initialize(mapload)
	. = ..()
	while(book_count > 0 && prob(ref_book_prob))
		book_count--
		new /obj/item/book/manual/random(src)
