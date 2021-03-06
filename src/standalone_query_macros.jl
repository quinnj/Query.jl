macro count(source, f)
    q = Expr(:quote, f)
    :(QueryOperators.count(QueryOperators.query($(esc(source))), $(esc(f)), $(esc(q))))
end

macro count(source)
    :(QueryOperators.count(QueryOperators.query($(esc(source)))))
end

macro groupby(source, elementSelector, resultSelector)
    elementSelector_as_anonym_func = helper_replace_anon_func_syntax(elementSelector)
    resultSelector_as_anonym_func = helper_replace_anon_func_syntax(resultSelector)

 	q_elementSelector = Expr(:quote, elementSelector_as_anonym_func)
	q_resultSelector = Expr(:quote, resultSelector_as_anonym_func)

    return :(QueryOperators.group_by(QueryOperators.query($(esc(source))), $(esc(elementSelector_as_anonym_func)), $(esc(q_elementSelector)), $(esc(resultSelector_as_anonym_func)), $(esc(q_resultSelector)))) |>
        helper_namedtuples_replacement |>
        helper_replace_field_extraction_syntax
end

macro groupby(elementSelector, resultSelector)
    elementSelector_as_anonym_func = helper_replace_anon_func_syntax(elementSelector)
    resultSelector_as_anonym_func = helper_replace_anon_func_syntax(resultSelector)

 	q_elementSelector = Expr(:quote, elementSelector_as_anonym_func)
	q_resultSelector = Expr(:quote, resultSelector_as_anonym_func)

    return :( i -> QueryOperators.group_by(QueryOperators.query(i), $(esc(elementSelector_as_anonym_func)), $(esc(q_elementSelector)), $(esc(resultSelector_as_anonym_func)), $(esc(q_resultSelector)))) |>
        helper_namedtuples_replacement |>
        helper_replace_field_extraction_syntax
end

macro groupby(elementSelector)
    elementSelector_as_anonym_func = helper_replace_anon_func_syntax(elementSelector)
    resultSelector_as_anonym_func = :(i->i)

 	q_elementSelector = Expr(:quote, elementSelector_as_anonym_func)
	q_resultSelector = Expr(:quote, resultSelector_as_anonym_func)

    return :( i -> QueryOperators.group_by(QueryOperators.query(i), $(esc(elementSelector_as_anonym_func)), $(esc(q_elementSelector)), $(esc(resultSelector_as_anonym_func)), $(esc(q_resultSelector)))) |>
        helper_namedtuples_replacement |>
        helper_replace_field_extraction_syntax
end

macro orderby(source, f)
    f_as_anonym_func = helper_replace_anon_func_syntax(f)
    q = Expr(:quote, f_as_anonym_func)
    return :(QueryOperators.orderby(QueryOperators.query($(esc(source))), $(esc(f_as_anonym_func)), $(esc(q)))) |>
        helper_namedtuples_replacement |>
        helper_replace_field_extraction_syntax
end

macro orderby(f)
    f_as_anonym_func = helper_replace_anon_func_syntax(f)
    q = Expr(:quote, helper_replace_anon_func_syntax(f_as_anonym_func))
    return :( i -> QueryOperators.orderby(QueryOperators.query(i), $(esc(f_as_anonym_func)), $(esc(q)))) |>
        helper_namedtuples_replacement |>
        helper_replace_field_extraction_syntax
end

macro orderby_descending(source, f)
    f_as_anonym_func = helper_replace_anon_func_syntax(f)
    q = Expr(:quote, f_as_anonym_func)
    return :(QueryOperators.orderby_descending(QueryOperators.query($(esc(source))), $(esc(f_as_anonym_func)), $(esc(q)))) |>
        helper_namedtuples_replacement |>
        helper_replace_field_extraction_syntax
end

macro orderby_descending(f)
    f_as_anonym_func = helper_replace_anon_func_syntax(f)
    q = Expr(:quote, helper_replace_anon_func_syntax(f_as_anonym_func))
    return :( i -> QueryOperators.orderby_descending(QueryOperators.query(i), $(esc(f_as_anonym_func)), $(esc(q)))) |>
        helper_namedtuples_replacement |>
        helper_replace_field_extraction_syntax
end

macro thenby(source, f)
    f_as_anonym_func = helper_replace_anon_func_syntax(f)
    q = Expr(:quote, f_as_anonym_func)
    return :(QueryOperators.thenby($(esc(source)), $(esc(f_as_anonym_func)), $(esc(q)))) |>
        helper_namedtuples_replacement |>
        helper_replace_field_extraction_syntax
end

macro thenby(f)
    f_as_anonym_func = helper_replace_anon_func_syntax(f)
    q = Expr(:quote, helper_replace_anon_func_syntax(f_as_anonym_func))
    return :( i -> QueryOperators.thenby(i, $(esc(f_as_anonym_func)), $(esc(q)))) |>
        helper_namedtuples_replacement |>
        helper_replace_field_extraction_syntax
end

macro thenby_descending(source, f)
    f_as_anonym_func = helper_replace_anon_func_syntax(f)
    q = Expr(:quote, f_as_anonym_func)
    return :(QueryOperators.thenby_descending($(esc(source)), $(esc(f_as_anonym_func)), $(esc(q)))) |>
        helper_namedtuples_replacement |>
        helper_replace_field_extraction_syntax
end

macro thenby_descending(f)
    f_as_anonym_func = helper_replace_anon_func_syntax(f)
    q = Expr(:quote, helper_replace_anon_func_syntax(f_as_anonym_func))
    return :( i -> QueryOperators.thenby_descending(i, $(esc(f_as_anonym_func)), $(esc(q)))) |>
        helper_namedtuples_replacement |>
        helper_replace_field_extraction_syntax
end

macro select(source, f)
    f_as_anonym_func = helper_replace_anon_func_syntax(f)
    q = Expr(:quote, f_as_anonym_func)
    return :(QueryOperators.select(QueryOperators.query($(esc(source))), $(esc(f_as_anonym_func)), $(esc(q)))) |>
        helper_namedtuples_replacement |>
        helper_replace_field_extraction_syntax
end

macro select(f)
    f_as_anonym_func = helper_replace_anon_func_syntax(f)
    q = Expr(:quote, f_as_anonym_func)
    return :( i-> QueryOperators.select(QueryOperators.query(i), $(esc(f_as_anonym_func)), $(esc(q))) ) |>
        helper_namedtuples_replacement |>
        helper_replace_field_extraction_syntax
end

macro where(source, f)
    f_as_anonym_func = helper_replace_anon_func_syntax(f)
    q = Expr(:quote, f_as_anonym_func)
    return :(QueryOperators.where(QueryOperators.query($(esc(source))), $(esc(f_as_anonym_func)), $(esc(q)))) |>
        helper_namedtuples_replacement |>
        helper_replace_field_extraction_syntax
end

macro where(f)
    f_as_anonym_func = helper_replace_anon_func_syntax(f)
    q = Expr(:quote, helper_replace_anon_func_syntax(f_as_anonym_func))
    return :( i -> QueryOperators.where(QueryOperators.query(i), $(esc(f_as_anonym_func)), $(esc(q)))) |>
        helper_namedtuples_replacement |>
        helper_replace_field_extraction_syntax
end
