public with sharing class ControllerForThreeLVLFinishTask {

    public String NameObject { get; set; }
    public String nameWhereWord { get; set; }
    public String nameWhereWord2 { get; set; }
    public String nameWhereWord3 { get; set; }
    public String nameFieldforWhere { get; set; }
    public String nameFieldforWhere2 { get; set; }
    public String nameFieldforWhere3 { get; set; }
    public String unionWhereWord { get; set; }
    public String textForWhere { get; set; }
    public String textForWhere2 { get; set; }
    public String textForWhere3 { get; set; }
    public String limitCount { get; set; }
    public String nameFieldforSort { get; set; }
    public String nameSORTItem { get; set; }
    public String soqlQueryForParametrs { get; set; }
    public String nameSortItemStartOREnd { get; set; }
    public static String staticSoqlItems { get; set; }
    public Integer countOfsetForPagination { get; set; }
    public String doubleSoqlQueryParametrs { get; set; }
    public String columnForSortedParam { get; set; }
    String allFieldForQuery;
    public String sortCall ;
    public boolean visBlock1 { get; set; }
    public boolean visBlock2 { get; set; }
    public boolean queryBlock { get; set; }
    public boolean sortLine = true;
    public boolean renderedBlockWHereANDSort { get; set; }
    public boolean formRendered { get; set; }
    public boolean divMessageRendered { get; set; }
    public boolean flaseTrue { get; set; }
    public boolean pan1 { get; set; }
    public Boolean renderButtonSave { get; set; }

    public List<String> fieldsForPage { get; set; }
    public List<SObject> fullListForQuery { get; set; }
    public List<SelectOption> listForSortStartAndEnd { get; set; }
    public List<DescribeFieldResult> listFieldsForObject { get; set; }
    public List<SelectOption> listWhereOperation { get; set; }
    public List<SelectOption> listSortASCAndDESC { get; set; }
    public List<SelectOption> nameFields { get; set; }
    public List<SelectOption> listUnionWhere { get; set; }
    public List<String> lstFieldsForobject { get; set; }
    public List<SelectOption> lstfieldsforWhere { get; set; }
    public List<SelectOption> lstoperationforWhere { get; set; }
    public List<String> lstwordforWhere { get; set; }
    public List<SObject> lstSobjectForQuery { get; set; }
    public List<Integer> lstGetCountLineWhereBlock { get; set; }
    Map<String, Schema.SObjectType> mapAllobject;
    public List<Integer> iterator { get; set; }
    public Contact con { get; set; }


    public ControllerForThreeLVLFinishTask() {
        con = new Contact(LastName = '3333');
        renderButtonSave = false;
        fullListForQuery = new List<SObject>();
        visBlock1 = false;
        visBlock2 = false;
        queryBlock = false;
        renderedBlockWHereANDSort = false;
        countOfsetForPagination = 0;
        limitCount = '0';
        methodForWhereAndSort();
        soqlQueryForParametrs = '';
        formRendered = true;
        lstfieldsforWhere = new List<SelectOption>();
        lstfieldsforWhere.add(new SelectOption('', ''));
        lstoperationforWhere = new List<SelectOption>();
        lstoperationforWhere.add(new SelectOption('', ''));
        lstwordforWhere = new List<String>();
        lstwordforWhere.add('');
        iterator = new List<Integer>();
        iterator.add(0);
        flaseTrue = false;
        pan1 = false;

    }

    public List<SelectOption> getListNameObject() {
        mapAllobject = Schema.getGlobalDescribe();
        List<SelectOption> selectListAll = new List<SelectOption>();
        for (String str : mapAllObject.keySet()) {
            /*    SObjectType schemaType = Schema.getGlobalDescribe().get(str);
              if(schemaType.getDescribe().accessible == true) {*/
            selectListAll.add(new SelectOption(str, str));

        }
        visBlock1 = true;
        return selectListAll;
    }

    public void FieldsForObject() {
        soqlQueryForParametrs = '';
        visBlock1 = true;
        nameFields = new List<SelectOption>();

        Schema.SObjectType sobjType = mapAllobject.get(NameObject);
        Schema.DescribeSObjectResult describeResult = sobjType.getDescribe();
        Map<String, Schema.SObjectField> fieldsMap = describeResult.fields.getMap();

        for (Schema.SObjectField str : fieldsMap.values()) {
            string s = str.getDescribe().getName();
            if (Schema.getGlobalDescribe().get(NameObject).getDescribe().fields.getMap().get(s).getDescribe().isAccessible() == true) {
                nameFields.add(new SelectOption(s, s));
            }
        }

    }
    public void methodForWhereAndSort() {
        visBlock2 = true;
        listWhereOperation = new List<SelectOption>();
        listWhereOperation.add(new SelectOption('', ''));
        listWhereOperation.add(new SelectOption('=', '='));
        listWhereOperation.add(new SelectOption('!=', '!='));
        listWhereOperation.add(new SelectOption('>', '>'));
        listWhereOperation.add(new SelectOption('<', '<'));
        listWhereOperation.add(new SelectOption('>=', '>='));
        listWhereOperation.add(new SelectOption('<=', '<='));
        listWhereOperation.add(new SelectOption('LIKE', 'LIKE'));
        listWhereOperation.add(new SelectOption('START', 'START'));
        listWhereOperation.add(new SelectOption('END', 'END'));

        listSortASCAndDESC = new List<SelectOption>();
        listSortASCAndDESC.add(new SelectOption('', ''));
        listSortASCAndDESC.add(new SelectOption('ASC', 'ASC'));
        listSortASCAndDESC.add(new SelectOption('DESC', 'DESC'));

        listForSortStartAndEnd = new List<SelectOption>();
        listForSortStartAndEnd.add(new SelectOption('', ''));
        listForSortStartAndEnd.add(new SelectOption('NULLS FIRST', 'NULLS FIRST'));
        listForSortStartAndEnd.add(new SelectOption('NULLS LAST', 'NULLS LAST'));

        listUnionWhere = new List<SelectOption>();
        listUnionWhere.add(new SelectOption('', ''));
        listUnionWhere.add(new SelectOption('OR', 'OR'));
        listUnionWhere.add(new SelectOption('AND', 'AND'));
    }

    public void sumSoqlQueryText() {
        renderedBlockWHereANDSort = true;
        System.debug('static soql ' + staticSoqlItems);
        System.debug('query soql ' + soqlQueryForParametrs);
        allFieldForQuery = '';

        for (String str : lstFieldsForobject) {
            allFieldForQuery = allFieldForQuery + str + ', ';
        }
        allFieldForQuery = allFieldForQuery.substringBeforeLast(',');
        soqlQueryForParametrs = 'SELECT ' + allFieldForQuery + ' FROM ' + NameObject ;
        System.debug('V 1 forme ' + soqlQueryForParametrs);
        doubleSoqlQueryParametrs = soqlQueryForParametrs;
    }
    // ДЛЯ WHERE
    public void whereMethod() {
        staticSoqlItems = soqlQueryForParametrs;
        String partSoql;
        String testnameFieldforWhere;
        String testnameWhereWord;
        String testtextForWhere;
        testnameFieldforWhere = nameFieldforWhere;
        testnameWhereWord = nameWhereWord;
        testtextForWhere = textForWhere;

        if (String.isNotEmpty(textForWhere3)) {
            nameWhereWord = nameWhereWord3;
            textForWhere = textForWhere3;
            nameFieldforWhere = nameFieldforWhere3;
        } else if (String.isNotEmpty(textForWhere2)) {
            nameWhereWord = nameWhereWord2;
            textForWhere = textForWhere2;
            nameFieldforWhere = nameFieldforWhere2;
        }

        if (nameWhereWord != null) {
            // определяю тип филда который выбираю в условии WHERE
            System.debug('y tyt 1' + nameWhereWord);
            Schema.SObjectType sobjType = mapAllobject.get(NameObject);
            Map<String, Schema.SObjectField> fieldMap = sobjType.getDescribe().fields.getMap();
            Schema.DisplayType dsplayTypeFieldForWhere = fieldMap.get(nameFieldforWhere).getDescribe().getType();
            System.debug('dspl ' + dsplayTypeFieldForWhere);

            if (nameWhereWord == '=' || nameWhereWord == '!=' || nameWhereWord == '<' || nameWhereWord == '>' || nameWhereWord == '>=' || nameWhereWord == '<=') {
                if (String.valueOf(dsplayTypeFieldForWhere) == 'STRING' || String.valueOf(dsplayTypeFieldForWhere) == 'ID' || String.valueOf(dsplayTypeFieldForWhere) == 'REFERENCE' ||
                        String.valueOf(dsplayTypeFieldForWhere) == 'PICKLIST') {
                    partSoql = ' ' + nameFieldforWhere + ' ' + nameWhereWord + ' \'' + textForWhere + '\'';
                } else {
                    partSoql = ' ' + nameFieldforWhere + ' ' + nameWhereWord + ' ' + textForWhere;
                }
            }
            if (nameWhereWord == 'LIKE') {
                if (String.valueOf(dsplayTypeFieldForWhere) == 'STRING' || String.valueOf(dsplayTypeFieldForWhere) == 'ID' || String.valueOf(dsplayTypeFieldForWhere) == 'REFERENCE' ||
                        String.valueOf(dsplayTypeFieldForWhere) == 'PICKLIST' || String.valueOf(dsplayTypeFieldForWhere) == 'PHONE') {
                    partSoql = ' ' + nameFieldforWhere + ' LIKE ' + '\'%' + textForWhere + '%\'';
                } else
                        partSoql = ' ' + nameFieldforWhere + ' LIKE ' + '%' + textForWhere + '%';
            }
            if (nameWhereWord == 'START') {
                if (String.valueOf(dsplayTypeFieldForWhere) == 'STRING' || String.valueOf(dsplayTypeFieldForWhere) == 'ID' || String.valueOf(dsplayTypeFieldForWhere) == 'REFERENCE' ||
                        String.valueOf(dsplayTypeFieldForWhere) == 'PICKLIST' || String.valueOf(dsplayTypeFieldForWhere) == 'PHONE') {
                    partSoql = ' ' + nameFieldforWhere + ' LIKE ' + '\'' + textForWhere + '%\'' ;
                } else
                        partSoql = ' ' + nameFieldforWhere + ' LIKE ' + textForWhere + '%';
            }
            if (nameWhereWord == 'END') {
                if (String.valueOf(dsplayTypeFieldForWhere) == 'STRING' || String.valueOf(dsplayTypeFieldForWhere) == 'ID' || String.valueOf(dsplayTypeFieldForWhere) == 'REFERENCE' ||
                        String.valueOf(dsplayTypeFieldForWhere) == 'PICKLIST') {
                    partSoql = ' ' + nameFieldforWhere + ' LIKE ' + '\'%' + textForWhere + '\'' ;
                } else partSoql = ' ' + nameFieldforWhere + ' LIKE ' + '%' + textForWhere ;
            }

            if (String.isEmpty(unionWhereWord)) {
                soqlQueryForParametrs = staticSoqlItems + ' WHERE ' + partSoql;
            } else {
                soqlQueryForParametrs = staticSoqlItems + ' ' + unionWhereWord + partSoql;
            }
        }
        nameFieldforWhere = testnameFieldforWhere;
        nameWhereWord = testnameWhereWord ;
        textForWhere = testtextForWhere;
        doubleSoqlQueryParametrs = soqlQueryForParametrs;

    }
    public void sortMethod() {
        // выбор сортировки куда ставить нулевые значения
        if (!soqlQueryForParametrs.contains('ORDER')) {
            if (nameSORTItem == 'DESC' || nameSORTItem == 'ASC') {
                soqlQueryForParametrs = soqlQueryForParametrs + ' ORDER BY ' + nameFieldforSort + ' ' + nameSORTItem + ' ' + nameSortItemStartOREnd;
                doubleSoqlQueryParametrs = soqlQueryForParametrs;
            }
        }
    }
    public void limitMethod() {
        if (limitCount != '0') {
            soqlQueryForParametrs = soqlQueryForParametrs + ' LIMIT ' + limitCount;
        }
        System.debug('добавляем лимит к  ' + soqlQueryForParametrs);
        doubleSoqlQueryParametrs = soqlQueryForParametrs;
        checkCorrectQuery();
    }

    public void methodGetResultForQuery() {
        queryBlock = true;
        fieldsForPage = new List<String>();
        fieldsForPage.clear();
        fieldsForPage.addAll(lstFieldsForobject);
        System.debug('getMtehod');
        System.debug('ssasasa' + soqlQueryForParametrs);
        System.debug('dadada' + doubleSoqlQueryParametrs);
        String subStr;
        if (!doubleSoqlQueryParametrs.contains('LIMIT')) {
            System.debug('ne soderjit limit');
            doubleSoqlQueryParametrs = soqlQueryForParametrs + ' LIMIT 10';
        } else {

            doubleSoqlQueryParametrs = soqlQueryForParametrs;
        }

        subStr = soqlQueryForParametrs.substringBetween('SELECT ', 'FROM');
        subStr = subStr.remove(',');
        lstFieldsForobject = subStr.split(' ');
        System.debug('listik ' + lstFieldsForobject);
        checkCorrectQuery();
    }
    public void saveTable() {
        update lstSobjectForQuery;
    }

    public void previousPage() {
        if (countOfsetForPagination - 10 >= 0) {
            countOfsetForPagination -= 10;
            if (doubleSoqlQueryParametrs.contains('OFFSET')) {
                if ((Integer.valueOf(limitCount) > 10 || limitCount == '0')) {
                    lstSobjectForQuery = Database.query('SELECT ' + doubleSoqlQueryParametrs.replace(limitCount, '10').substringBetween('SELECT', 'OFFSET') + ' OFFSET ' + countOfsetForPagination);
                } else {
                    lstSobjectForQuery = Database.query('SELECT ' + doubleSoqlQueryParametrs.substringBetween('SELECT', 'OFFSET') + ' OFFSET ' + countOfsetForPagination);
                }
            } else {
                if ((Integer.valueOf(limitCount) > 10 || limitCount == '0')) {
                    lstSobjectForQuery = Database.query(doubleSoqlQueryParametrs.substringBefore('LIMIT') + ' LIMIT ' + '10 ' + ' OFFSET ' + countOfsetForPagination);
                } else {
                    lstSobjectForQuery = Database.query(doubleSoqlQueryParametrs + ' OFFSET ' + countOfsetForPagination);
                }
            }
        } else {
            FirstPage();
        }
    }

    public void NextPage() {
        fullListForQuery = Database.query(soqlQueryForParametrs.substringBefore('LIMIT') + (limitCount != '0' ? +' LIMIT ' + limitCount : ''));
        if (countOfsetForPagination <= fullListForQuery.size() - 10) {
            countOfsetForPagination += 10;
            if (Integer.valueOf(limitCount) > 10) {
                Integer gg = Integer.valueOf(limitCount);
                gg = gg - countOfsetForPagination;
                String counterLimit = String.valueOf(gg);
                lstSobjectForQuery = Database.query('SELECT ' + doubleSoqlQueryParametrs.substringBetween('SELECT', 'LIMIT') + ' LIMIT ' + counterLimit + ' OFFSET ' + countOfsetForPagination);
            } else {
                lstSobjectForQuery = Database.query(doubleSoqlQueryParametrs + ' OFFSET ' + countOfsetForPagination);
            }
        }
    }
    public void FirstPage() {
        if (countOfsetForPagination != 0) {
            countOfsetForPagination = 0;
            if (soqlQueryForParametrs.contains('OFFSET')) {
                if (Integer.valueOf(limitCount) > 10 || limitCount == '0') {
                    lstSobjectForQuery = Database.query(doubleSoqlQueryParametrs.replace(limitCount, '10').substringBefore(' OFFSET') + ' OFFSET ' + countOfsetForPagination);
                } else {
                    lstSobjectForQuery = Database.query(doubleSoqlQueryParametrs.substringBefore(' OFFSET') + ' OFFSET ' + countOfsetForPagination);
                }
            } else {
                if (Integer.valueOf(limitCount) > 10) {
                    lstSobjectForQuery = Database.query(doubleSoqlQueryParametrs.replace(limitCount, '10') + ' OFFSET ' + countOfsetForPagination);
                } else {
                    lstSobjectForQuery = Database.query(doubleSoqlQueryParametrs + ' OFFSET ' + countOfsetForPagination);
                }
            }
        }
    }
    public void LastPage() {
        System.debug(doubleSoqlQueryParametrs);
        if (limitCount == '0') {
            fullListForQuery = Database.query(doubleSoqlQueryParametrs.substringBefore(' LIMIT'));
        } else if (Integer.valueOf(limitCount) > 10 || Integer.valueOf(limitCount) < 10) {
            fullListForQuery = Database.query(doubleSoqlQueryParametrs.substringBefore(' LIMIT') + ' LIMIT ' + limitCount);
        }

        System.debug('fls ' + fullListForQuery);
        Integer sizeListQuery = fullListForQuery.size() / 10;
        countOfsetForPagination = sizeListQuery * 10;
        Integer newLim = fullListForQuery.size() - countOfsetForPagination;
        System.debug('newLim' + newLim);
        System.debug('count =' + countOfsetForPagination);
        try {
            if (Integer.valueOf(limitCount) > 10 || limitCount == '0') {
                lstSobjectForQuery = Database.query(doubleSoqlQueryParametrs.replace(limitCount, String.valueOf(newLim)).substringBefore(' OFFSET') + ' OFFSET ' + countOfsetForPagination);
            } else {
                lstSobjectForQuery = Database.query(doubleSoqlQueryParametrs.substringBefore(' OFFSET') + ' OFFSET ' + countOfsetForPagination);
            }
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, e.getMessage()));
        }
    }

    public void getsortedTableResult() {
        Integer offseter;
        fullListForQuery = Database.query(doubleSoqlQueryParametrs.substringBefore('LIMIT'));
        offseter = fullListForQuery.size() - Integer.valueOf(limitCount);
        System.debug('v sorte');
        columnForSortedParam = ApexPages.currentPage().getParameters().get('param');
        System.debug(doubleSoqlQueryParametrs);
        if (sortLine == true) {
            if (sortCall != null && sortCall != '') {
                doubleSoqlQueryParametrs = doubleSoqlQueryParametrs.remove(sortCall).replace(String.valueOf(offseter), '0') + ' ORDER BY ' + columnForSortedParam + ' ASC ';
            } else {
                doubleSoqlQueryParametrs = doubleSoqlQueryParametrs.replace(String.valueOf(offseter), '0') + ' ORDER BY ' + columnForSortedParam + ' ASC ';
            }
            sortLine = false;
        } else {
            if (limitCount != '0') {
                if (sortCall != null && sortCall != '') {
                    doubleSoqlQueryParametrs = doubleSoqlQueryParametrs.remove(sortCall) + ' ORDER BY ' + columnForSortedParam + ' DESC ' + ' OFFSET ' + offseter ;
                } else {
                    doubleSoqlQueryParametrs = doubleSoqlQueryParametrs + ' ORDER BY ' + columnForSortedParam + ' DESC ' + ' OFFSET ' + offseter ;
                }
            } else {
                if (sortCall != null && sortCall != '') {
                    doubleSoqlQueryParametrs = doubleSoqlQueryParametrs.remove(sortCall) + ' ORDER BY ' + columnForSortedParam + ' DESC ' ;
                } else {
                    doubleSoqlQueryParametrs = doubleSoqlQueryParametrs + ' ORDER BY ' + columnForSortedParam + ' DESC ' + ' OFFSET ';
                }
            }
            sortLine = true;
        }
        checkCorrectQuery();
    }
    public void checkCorrectQuery() {
        System.debug('v check methode');
        String mainCall;
        String whereCall = '';
        String limitCall = '';
        String offsetCall = '';
        String correctQueryString;
        System.debug('doubleDD ' + doubleSoqlQueryParametrs);
        mainCall = 'SELECT ' + allFieldForQuery + ' FROM ' + NameObject;
        System.debug('MAIN ' + mainCall);

        if (doubleSoqlQueryParametrs.contains('WHERE')) {
            if (doubleSoqlQueryParametrs.contains('ORDER') || doubleSoqlQueryParametrs.contains('LIMIT') || doubleSoqlQueryParametrs.contains('OFFSET')) {
                whereCall = doubleSoqlQueryParametrs.substringAfter('WHERE ');
                if (whereCall.substringBefore('OFFSET').length() < whereCall.substringBefore('LIMIT').length() && whereCall.substringBefore('OFFSET').length() < whereCall.substringBefore('ORDER').length()) {
                    whereCall = whereCall.substringBefore(' OFFSET');
                } else if (whereCall.substringBefore('LIMIT').length() < whereCall.substringBefore('OFFSET').length() && whereCall.substringBefore('LIMIT').length() < whereCall.substringBefore('ORDER').length()) {
                    whereCall = whereCall.substringBefore(' LIMIT');
                } else {
                    whereCall = whereCall.substringBefore(' ORDER');
                }
            }
            System.debug('WHERE =' + whereCall);
        }
        if (doubleSoqlQueryParametrs.contains('ORDER')) {
            Integer count = 0;
            List<String> str = doubleSoqlQueryParametrs.split(' ');
            for (Integer i = 0; i < str.size(); i++) {
                if (str[i].equals('BY')) {
                    count = i;
                }
            }
            sortCall = ' ORDER BY ' + str[count + 1] + ' ' + str[count + 2];
            System.debug('sort = ' + sortCall);
        }
        if (doubleSoqlQueryParametrs.contains('LIMIT')) {
            List <String> lst = doubleSoqlQueryParametrs.split(' ');
            for (Integer i = 0; i < lst.size(); i++) {
                if (lst[i].contains('LIMIT')) {
                    limitCall = lst[i + 1];
                }
            }
        }
        if (doubleSoqlQueryParametrs.contains('OFFSET')) {
            List <String> lst = doubleSoqlQueryParametrs.split(' ');
            for (Integer i = 0; i < lst.size(); i++) {
                if (lst[i].contains('OFFSET')) {
                    offsetCall = lst[i + 1];
                }
            }
        }
        System.debug('limit =' + limitCall);
        System.debug('sorted =' + sortCall);
        System.debug('offset = ' + offsetCall);
        correctQueryString = mainCall;
        correctQueryString = mainCall + (whereCall != null && whereCall != '' ? ' WHERE ' + whereCall : '') + (sortCall != null && sortCall != '' ? sortCall : '') +
                (limitCall != null && limitCall != '' ? ' LIMIT ' + limitCall : '') + (offsetCall != null && offsetCall != '' ? ' OFFSET ' + offsetCall : '');
        System.debug('DOUBLE DOUBLE + ' + correctQueryString);
        System.debug('doubleSoqlQueryParametrs ' + doubleSoqlQueryParametrs);
        System.debug('correctQueryString' + correctQueryString);
        doubleSoqlQueryParametrs = correctQueryString;
        if (limitCount == '0') {
            soqlQueryForParametrs = correctQueryString.substringBefore('LIMIT ');
        } else {
            soqlQueryForParametrs = correctQueryString.substringBefore(('OFFSET'));
        }
        try {
            if (Integer.valueOf(limitCount) > 10) {
                lstSobjectForQuery = Database.query(doubleSoqlQueryParametrs.replace(limitCount, '10'));
            } else {
                lstSobjectForQuery = Database.query(doubleSoqlQueryParametrs);
            }
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, e.getMessage()));
            System.debug(e.getMessage());
            renderedBlockWHereANDSort = false;
            queryBlock = false;
            visBlock1 = false;
            textForWhere = '';
            nameFieldforWhere = '';
            nameWhereWord = '';
            limitCount = '0';
            divMessageRendered = true;

        }
    }

    public void repeatWhere() {
        pan1 = true;

        if (flaseTrue == false) {
            lstfieldsforWhere.clear();
            lstoperationforWhere.clear();
            lstwordforWhere.clear();


        }
        lstfieldsforWhere.add(new SelectOption(nameFieldforWhere, nameFieldforWhere));
        lstoperationforWhere.add(new SelectOption(nameWhereWord, nameWhereWord));
        lstwordforWhere.add(textForWhere);
        iterator.add(lstwordforWhere.size() - 1);
        System.debug('iterator ' + iterator);
        System.debug('lstfieldsforWhere' + lstfieldsforWhere);

        if (flaseTrue == false) {
            iterator.remove(1);
        }
        flaseTrue = true;
    }
    public void showButtonSave() {
        renderButtonSave = true;
        System.debug('renderButtonSave' + renderButtonSave);
    }
}