//
//  VCCountrySelection.m
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/24/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCCountrySelection.h"
#import "VCSearchJob.h"
#import "CountryList.h"

@interface VCCountrySelection (){
    BOOL *_isSearching;
    UITableViewCell *_selectedCell;
    
    NSArray *_countryArray;
    CountryList *_countryList;
    NSMutableArray *_resultsArray, *_alphaArray;
    NSMutableDictionary *_countryDictionary, *_resultsDictionary, *_alphaDictionary;
}

@end

@implementation VCCountrySelection

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    if(self.selectedFields != nil)
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    
    _isSearching = NO;
    _countryArray = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"Y",@"Z"];
    _countryDictionary = [NSMutableDictionary dictionary];
    _countryList = [[CountryList alloc] init];
    
    [_countryDictionary setObject:_countryList.aCountries forKey:_countryArray[0]];
    [_countryDictionary setObject:_countryList.bCountries forKey:_countryArray[1]];
    [_countryDictionary setObject:_countryList.cCountries forKey:_countryArray[2]];
    [_countryDictionary setObject:_countryList.dCountries forKey:_countryArray[3]];
    [_countryDictionary setObject:_countryList.eCountries forKey:_countryArray[4]];
    [_countryDictionary setObject:_countryList.fCountries forKey:_countryArray[5]];
    [_countryDictionary setObject:_countryList.gCountries forKey:_countryArray[6]];
    [_countryDictionary setObject:_countryList.hCountries forKey:_countryArray[7]];
    [_countryDictionary setObject:_countryList.iCountries forKey:_countryArray[8]];
    [_countryDictionary setObject:_countryList.jCountries forKey:_countryArray[9]];
    [_countryDictionary setObject:_countryList.kCountries forKey:_countryArray[10]];
    [_countryDictionary setObject:_countryList.lCountries forKey:_countryArray[11]];
    [_countryDictionary setObject:_countryList.mCountries forKey:_countryArray[12]];
    [_countryDictionary setObject:_countryList.nCountries forKey:_countryArray[13]];
    [_countryDictionary setObject:_countryList.oCountries forKey:_countryArray[14]];
    [_countryDictionary setObject:_countryList.pCountries forKey:_countryArray[15]];
    [_countryDictionary setObject:_countryList.qCountries forKey:_countryArray[16]];
    [_countryDictionary setObject:_countryList.rCountries forKey:_countryArray[17]];
    [_countryDictionary setObject:_countryList.sCountries forKey:_countryArray[18]];
    [_countryDictionary setObject:_countryList.tCountries forKey:_countryArray[19]];
    [_countryDictionary setObject:_countryList.uCountries forKey:_countryArray[20]];
    [_countryDictionary setObject:_countryList.vCountries forKey:_countryArray[21]];
    [_countryDictionary setObject:_countryList.wCountries forKey:_countryArray[22]];
    [_countryDictionary setObject:_countryList.yCountries forKey:_countryArray[23]];
    [_countryDictionary setObject:_countryList.zCountries forKey:_countryArray[24]];

    _resultsArray = [NSMutableArray arrayWithArray:_countryArray];
    _resultsDictionary = [NSMutableDictionary dictionaryWithDictionary:_countryDictionary];
    _alphaArray = [NSMutableArray array];
    _alphaDictionary = [NSMutableDictionary dictionary];
    
    self.lv.delegate = self;
    self.lv.dataSource = self;
    self.lv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.propFieldSearch.delegate = self;
}

- (void)done{
    _selectedCell.detailTextLabel.text = [NSString stringWithFormat:@"%d",(int)_selectedFields.count];
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSString *searched;
    if(range.length>0)
        searched = [NSString stringWithFormat:@"%@",[searchBar.text substringWithRange:NSMakeRange(0, [searchBar.text length]-1)]];
    else
        searched = [NSString stringWithFormat:@"%@%@",searchBar.text,text];
    
    if([searched length] == 1){
        [_alphaArray removeAllObjects];
        [_alphaDictionary removeAllObjects];
        NSString *key = [[NSString stringWithFormat:@"%c",[searched characterAtIndex:0]] uppercaseString];
        [_alphaArray addObject:key];
        [_alphaDictionary setObject:[_countryDictionary objectForKey:key] forKey:key];
        
        [_resultsArray removeAllObjects];
        [_resultsDictionary removeAllObjects];
        
        [_resultsArray addObject:key];
        [_resultsDictionary setObject:[_alphaDictionary objectForKey:key] forKey:key];
    }else if([searched length] > 1){
        NSString *key = _alphaArray[0];
        NSMutableArray *arr = [NSMutableArray array];
        for(NSString *country in [_alphaDictionary objectForKey:key]){
            if([[country lowercaseString] hasPrefix:[searched lowercaseString]])
                [arr addObject:country];
        }
        
        [_resultsArray removeAllObjects];
        [_resultsDictionary removeAllObjects];
        
        [_resultsArray addObject:key];
        [_resultsDictionary setObject:arr forKey:key];
    }else{
        [_resultsArray removeAllObjects];
        [_resultsDictionary removeAllObjects];
        [_resultsArray addObjectsFromArray:_countryArray];
        [_resultsDictionary setDictionary:_countryDictionary];
    }
    
    [self.lv reloadData];
    
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"%@", _resultsArray);
    NSLog(@"");
    NSLog(@"%@",_resultsDictionary);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [[_resultsDictionary objectForKey:[_resultsArray objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
    cell. accessoryType = (self.selectedFields!=nil && [self.selectedFields containsObject:cell.textLabel.text])?UITableViewCellAccessoryCheckmark:UITableViewCellAccessoryNone;
    

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.selectedFields == nil){
        _selectedCell.detailTextLabel.text = [[_resultsDictionary objectForKey:[_resultsArray objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
        [self.navigationController popViewControllerAnimated:TRUE];
    }else{
        if([self.selectedFields containsObject:[tableView cellForRowAtIndexPath:indexPath].textLabel.text])
            [self.selectedFields removeObject:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
        else
            [self.selectedFields addObject:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];

        [tableView reloadData];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [_resultsArray objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[_resultsDictionary objectForKey:[_resultsArray objectAtIndex:section]] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _resultsArray.count;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return _resultsArray;
}

- (void)cellSelectorSelectedCell:(UITableViewCell *)cell{
    _selectedCell = cell;
}

@end
